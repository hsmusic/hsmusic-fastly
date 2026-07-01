# hsmusic-fastly

This repository is four things at once:

1. Some JavaScript programs you run in a particular sequence to bring a great big "pages" dictionary up to date whenever you're doing an update to the music wiki (provided the update adds or removes any pages)

2. The folder that holds the in-between state of those programs ("result"), plus a folder with metadata that hooks the code up with Fastly services, including credentials ("secret")

3. The standalone Fastly VCL file which instructs Fastly to do the websitey thing, with only AWS object storage on the other end (in our case object storage provided by Fastly)

4. Documentation for interacting with all this stuff, and setting up a new Fastly service from scratch

## Update the website

### do a build (and put it into object storage)

> [!NOTE]
> HEY! Have you thought about updating the wiki cachebust?
> Look, chances are good you updated the CSS or JavaScript.
> You should maybe go do that. (It's in urls-default.yaml.)

> [!TIP]
> All the commands listed here skip out on `--profile fastly`.
> Depending how you've got your local AWS credentials set up,
> provide that (or similar) in each relevant `aws` command.

```
# just make sure you've run hsmusic once normally e.g. to
# start live-dev-server, with latest data/media available,
# because file-size-cache.json is generated separate
# from any other step

# then...

hsmusic --thumbs-only

aws s3 cp --acl public-read cache/media-cache/thumbnail-cache.json s3://hsmusic-media/
aws s3 cp --acl public-read media/file-size-cache.json s3://hsmusic-media/

# in the background or whenever
aws s3 sync --acl public-read --exclude '.git/*' media s3://hsmusic-media
aws s3 sync --acl public-read cache/media-cache s3://hsmusic-media

# test shit's working
hsmusic --urls online-media --skip-thumbs --live-dev-server

# build as normal
hsmusic --urls online-media --skip-thumbs --static-build

aws s3 sync --acl public-read out <www-bucket>
# where <www-bucket> is
#   s3://hsmusic-release-slot1
#   s3://hsmusic-release-slot2
#   s3://hsmusic-preview
# to identify which buckets are currently in use, visit:
#   https://hsmusic.wiki/bucket.txt
#   https://staging.hsmusic.wiki/bucket.txt
#   https://preview.hsmusic.wiki/bucket.txt
# to UPDATE which bucket relase and staging point to
# (or any other service), change the "bucket" item
# in its "bucket" dictionary to the desired bucket.
```

### catch the pages dictionary up to date

First point `HSMUSIC_OUT` to the correct output directory. It's generally the same folder that hsmusic itself built to, but going to the right folder and setting it by hand is a reasonable safety check.

```
cd out-release-2026-07-01
export HSMUSIC_OUT="$(pwd)"
pwd
# /Users/nebula/hsmusic/out-release-2026-07-01
```

Also set `HSMUSIC_SERVICE` to a key of the `secret/fastly-services.js` file in this repository.

```
export HSMUSIC_SERVICE=staging
```

Then run these four scripts in order:

```
node operation/get-pages-in-hsmusic-output.js
node operation/get-pages-in-fastly-dictionaries.js
node operation/put-pages-to-fastly-dictionaries.js

# have a look at result/fastly-dictionary-bulk-ops.json
less result/fastly-dictionary-bulk-ops.json

node operation/execute-fastly-dictionary-bulk-ops.js
```

Dictionaries are part of live data immediately accessible to Fastly as soon as stuff is put online. Since the list of pages controls what ELSE is all 404s, and uploading to object storage is a distinct process, there will be either:

* a period of time where links exist but point to effective 404s
* a period of time where pages ostensibly exist and fetch from object storage, but the file isn't uploaded
* both, if you insist on running both these processes simultaneously

In the grand scheme of things it's small fry either way, but we recommend only updating the pages dictionary after all the new pages have been uploaded (i.e. `aws sync` to the relevant bucket is complete).

Depending on TTL settings, you may also want to do a full purge of whichever service's bucket and dictionaries you're updating.

## Start a service up from scratch

**step 1** make the service. It's one service per host, and by convention we're naming those services "HOSTNAME (Serverless)" e.g. "staging.hsmusic.wiki (Serverless)".

Enter the domain whichever domain you're serving from, e.g. `staging.hsmusic.wiki`

Enter the host field `us-east.object.fastlystorage.app` (honestly IDK if this field is actually used internally or not though lol)

Leave the other recommended settings in their default state.

Probably click "Save draft" instead of "Activate" - you'll need to work on a draft anyway for subsequent setup steps. Click "Clone to edit" next, if you click "Activate" now.

**step 2** point the TLS certificate correctly. The very first screen that comes up ("Domains" under service configuration) should show an "Action needed" line for the chosen domain. Click the "Secure domain" button on the end of that row, then do TLS stuff as needed. We're using Fastly-managed certificates with Certainly. The chosen domain might already match an existing Fastly-managed certificate - choose to reuse it to move ahead quickly-like.

**step 3** create aws and bucket and pages dictionaries

```
# write_only
curl -i -H "Accept: application/json" -H "Fastly-Key: <KEY>" "https://api.fastly.com/service/<SERVICE>/version/<VERSION>/dictionary" -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "name=aws&write_only=true"

# no write_only
curl -i -H "Accept: application/json" -H "Fastly-Key: <KEY>" "https://api.fastly.com/service/<SERVICE>/version/<VERSION>/dictionary" -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "name=bucket"
curl -i -H "Accept: application/json" -H "Fastly-Key: <KEY>" "https://api.fastly.com/service/<SERVICE>/version/<VERSION>/dictionary" -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "pages"
for i in $(seq 2 50); do curl -i -H "Accept: application/json" -H "Fastly-Key: <KEY>" "https://api.fastly.com/service/<SERVICE>/version/<VERSION>/dictionary" -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "name=pages$i"; done
```

"KEY" is your Fastly authentication token. "SERVICE" is the ID of your new service. "VERSION" is either 1 or 2, depending if you've activated the serice already (and clicked "clone to edit") or just left it as a draft. (Or a bigger number if you're adding in more dictionaries later.)

Adjust that `seq` value as needed. As of July 2026 working with dictionaries of max size 1000 and the preview site takes nearly 30,000 dictionary items to index what paths exist, so 50 * 1000 = SOME wiggle room. You can always add more dictioanries later.

**step 4** fill out bucket dictionary. It gets three items:

* `bucket` is the object storage bucket you're serving from and uploading to, e.g. `hsmusic-release-slot1`
* `region` is `us-east`
* `host` is `us-east.object.fastlystorage.app`

If you're working in the command line then the operation looks like this:

```
curl -i -H "Accept: application/json" -H "Fastly-Key: <KEY>" "https://api.fastly.com/service/<SERVICE>/dictionary/<DICTIONARY>/item/<ITEM>" -X PUT -H "Content-Type: application/x-www-form-urlencoded" -d "item_value=<VALUE>"
```

**step 5** fill out aws dictionary. It gets two items:

* `access_key` analogous to aws_access_key_id in `~/.aws/credentials`
* `secret_key` analogous to aws_secret_access_key in `~/.aws/credentials`

But it shouldn't actually be the same key you use for uploading, because Fastly will only be responsible for serving your site, not changing it. Use a purpose-made access key that does not have write permissions.

You can't update existing dictionary items of a write-only dicitonary using the web interface, so you might be best off with the `curl` command above for this step.

**step 6** upload the custom VCL file. Kinda far down in the service configuration sidebar, "VCL" > "Custom VCL" > "Upload custom VCL". We just name it "Custom VCL". The file is hsmusic-fastly.vcl in this repository.

Now's a good time to double check that the stupid long `match_pages` subroutine in the VCL file matches the number of `pages` dictionaries you made for this service. Fastly should automatically warn you (in a big yellow box of VCL warnings) if there's a mismatch.

**step 7** activate the service, which will officially K-O the relevant domain into a presently useless state IF you've got DNS for that domain already pointing directly to Fastly for any reason. So like optionally skip this step. Everything will probably be fine anyway. Yay!

**step 8** add the service (with a useful key you'll use for `HSMUSIC_SERVICE` very soon) into secret/fastly-services.js, e.g:

```
export default {
  staging: {
    name: 'staging.hsmusic.wiki (Serverless)',
    id: '1o8AJXmfVdzzR4YjOtu4Yr',
    version: 1,
  },
};
```

**step 9** do a build, and upload it to object storage in the same bucket as you've pointed this service toward

**step 10** fill in the pages dictionary using the scripts in this repository, which is the same process for the first run as for later updates

**step 11** CNAME that DNS!!!!

```
CNAME staging.hsmusic.wiki t.sni.global.fastly.net
```

**step 11a** Also you should probably test that everything is working before you set it live. I dunno, add a test domain or something, that'll prolly do it
