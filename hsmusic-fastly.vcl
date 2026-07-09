sub match_pages(STRING var.path) STRING {
  declare local var.match STRING;

  # ADJUST TO AVAILABLE LANGUAGES.
  # Preview may have more than currently present on release.
  if (var.path ~ "^/(es|vi)(/.*)") {
    set var.path = re.group.2;
  }

  set var.match = table.lookup(pages, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages2, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages3, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages4, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages5, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages6, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages7, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages8, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages9, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages10, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages11, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages12, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages13, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages14, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages15, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages16, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages17, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages18, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages19, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages20, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages21, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages22, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages23, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages24, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages25, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages26, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages27, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages28, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages29, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages30, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages31, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages32, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages33, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages34, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages35, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages36, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages37, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages38, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages39, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages40, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages41, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages42, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages43, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages44, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages45, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages46, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages47, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages48, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages49, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }
  set var.match = table.lookup(pages50, var.path); if (var.match == "file" || var.match ~ "^localized") { return var.match; }

  if (var.path ~ "(.*)oembed.json$") {
    set var.path = re.group.1;

    set var.match = table.lookup(pages, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages2, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages3, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages4, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages5, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages6, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages7, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages8, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages9, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages10, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages11, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages12, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages13, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages14, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages15, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages16, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages17, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages18, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages19, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages20, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages21, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages22, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages23, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages24, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages25, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages26, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages27, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages28, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages29, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages30, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages31, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages32, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages33, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages34, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages35, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages36, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages37, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages38, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages39, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages40, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages41, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages42, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages43, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages44, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages45, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages46, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages47, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages48, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages49, var.path); if (var.match == "localized-with-oembed") { return var.match; }
    set var.match = table.lookup(pages50, var.path); if (var.match == "localized-with-oembed") { return var.match; }
  }

  return "none";
}

sub vcl_recv {
  declare local var.page_match STRING;

#FASTLY recv
  # Redirect to append slash
  if (req.url.path ~ "/[^./]+$") {
    error 613 "redirect slash";
  }

  # Redirect to drop index.html
  if (req.url.path ~ "/index\.html$") {
    error 614 "redirect index.html";
  }

  # Specially handle bucket.txt
  if (req.url.path == "/bucket.txt") {
    error 615 "return bucket.txt";
  }

  # Match against pages dictionary
  set var.page_match = match_pages(req.url.path);
  if (var.page_match == "none") {
    set req.http.x-not-found-in-pages = "trouble in paradise";
    return(lookup);
  }

  # Normally, you should consider requests other than GET and HEAD to be uncacheable
  # (to this we add the special FASTLYPURGE method)
  if (req.method != "HEAD" && req.method != "GET" && req.method != "FASTLYPURGE") {
    return(pass);
  }

  # If you are using image optimization, insert the code to enable it here
  # See https://www.fastly.com/documentation/reference/io/ for more information.

  return(lookup);
}

sub vcl_hash {
  if (req.http.x-not-found-in-pages == "trouble in paradise") {
    # Skip including the path and use an arbitrary string instead,
    # shared by all 404's (that we predict)
    set req.hash += "fastly 404";
  } else {
    set req.hash += req.url;
  }

  # The host is universally relevant though, always part of the cache key
  set req.hash += req.http.host;

  #FASTLY hash

  return(hash);
}

sub vcl_hit {
#FASTLY hit
  return(deliver);
}

sub match_bucket(STRING var.host) STRING {
  /*
  declare local var.hsmusicReleaseBucket STRING;
  declare local var.hsmusicStagingBucket STRING;
  declare local var.hsmusicPreviewBucket STRING;

  set var.hsmusicReleaseBucket = table.lookup(bucket, "release");
  set var.hsmusicStagingBucket = table.lookup(bucket, "staging");
  set var.hsmusicPreviewBucket = table.lookup(bucket, "preview");

  if (var.host == "hsmusic.wiki" || var.host == "hsmusic-release.global.ssl.fastly.net") {
    return var.hsmusicReleaseBucket;
  } else if (var.host == "staging.hsmusic.wiki" || var.host == "hsmusic-staging.global.ssl.fastly.net") {
    return var.hsmusicStagingBucket;
  } else if (var.host == "preview.hsmusic.wiki" || var.host == "hsmusic-preview.global.ssl.fastly.net") {
    return var.hsmusicPreviewBucket;
  } else {
    return "none";
  }
  */

  return table.lookup(bucket, "bucket");
}

sub route_to_object_storage {
  declare local var.awsAccessKey STRING;
  declare local var.awsSecretKey STRING;
  declare local var.awsS3Bucket STRING;
  declare local var.awsRegion STRING;
  declare local var.awsS3Host STRING;

  set var.awsAccessKey = table.lookup(aws, "access_key");
  set var.awsSecretKey = table.lookup(aws, "secret_key");
  set var.awsRegion = table.lookup(bucket, "region");
  set var.awsS3Host = table.lookup(bucket, "host");

  declare local var.canonicalHeaders STRING;
  declare local var.signedHeaders STRING;
  declare local var.canonicalRequest STRING;
  declare local var.canonicalQuery STRING;
  declare local var.stringToSign STRING;
  declare local var.dateStamp STRING;
  declare local var.signature STRING;
  declare local var.scope STRING;

  set var.awsS3Bucket = match_bucket(req.http.host);
  if (var.awsS3Bucket == "none") {
    # This should be an internal error (6xx) with custom messaging,
    # ala "No Bucket", but we couldn't confidently get that working...
    error 503;
  }

  set bereq.http.x-amz-content-sha256 = digest.hash_sha256("");
  set bereq.http.x-amz-date = strftime({"%Y%m%dT%H%M%SZ"}, now);
  set bereq.http.host = var.awsS3Host;

  if (req.http.x-not-found-in-pages == "trouble in paradise") {
    set bereq.url = "/" + var.awsS3Bucket + "/404/";
  } else {
    set bereq.url = "/" + var.awsS3Bucket + bereq.url;
  }

  set bereq.url = querystring.remove(bereq.url);
  set bereq.url = regsuball(urlencode(urldecode(bereq.url)), {"%2F"}, "/");

  set bereq.url = regsub(bereq.url, "^(.*)/$", "\1/index.html");

  set var.dateStamp = strftime({"%Y%m%d"}, now);

  set var.canonicalHeaders = ""
    "host:" bereq.http.host LF
    "x-amz-content-sha256:" bereq.http.x-amz-content-sha256 LF
    "x-amz-date:" bereq.http.x-amz-date LF;

  set var.canonicalQuery = "";

  set var.signedHeaders = "host;x-amz-content-sha256;x-amz-date";

  set var.canonicalRequest = ""
    "GET" LF
    bereq.url.path LF
    var.canonicalQuery LF
    var.canonicalHeaders LF
    var.signedHeaders LF
    digest.hash_sha256("");

  set var.scope = var.dateStamp "/" var.awsRegion "/s3/aws4_request";

  set var.stringToSign = ""
    "AWS4-HMAC-SHA256" LF
    bereq.http.x-amz-date LF
    var.scope LF
    regsub(digest.hash_sha256(var.canonicalRequest),"^0x", "");

  set var.signature = digest.awsv4_hmac(
    var.awsSecretKey,
    var.dateStamp,
    var.awsRegion,
    "s3",
    var.stringToSign
  );

  set bereq.http.Authorization = "AWS4-HMAC-SHA256 "
    "Credential=" var.awsAccessKey "/" var.scope ", "
    "SignedHeaders=" var.signedHeaders ", "
    "Signature=" + regsub(var.signature,"^0x", "");

  unset bereq.http.Accept;
  unset bereq.http.Accept-Language;
  unset bereq.http.User-Agent;
  unset bereq.http.Fastly-Client-IP;
}

sub vcl_miss {
#FASTLY miss

  if (req.method == "GET" && !req.backend.is_shield) {
    call route_to_object_storage;
  }

  return(fetch);
}

sub vcl_pass {
#FASTLY pass
  return(pass);
}

sub vcl_fetch {
#FASTLY fetch

  # Unset headers that reduce cacheability for images processed using the Fastly image optimizer
  if (req.http.X-Fastly-Imageopto-Api) {
    unset beresp.http.Set-Cookie;
    unset beresp.http.Vary;
  }

  # Log the number of restarts for debugging purposes
  if (req.restarts > 0) {
    set beresp.http.Fastly-Restarts = req.restarts;
  }

  # If the response is setting a cookie, make sure it is not cached
  if (beresp.http.Set-Cookie) {
    return(pass);
  }

  # By default we set a TTL based on the `Cache-Control` header but we don't parse additional directives
  # like `private` and `no-store`. Private in particular should be respected at the edge:
  if (beresp.http.Cache-Control ~ "(?:private|no-store)") {
    return(pass);
  }

  # If no TTL has been provided in the response headers, set a default
  if (!beresp.http.Expires && !beresp.http.Surrogate-Control ~ "max-age" && !beresp.http.Cache-Control ~ "(?:s-maxage|max-age)") {
    set beresp.ttl = 31557600s;

    # Apply a longer default TTL for images processed using Image Optimizer
    if (req.http.X-Fastly-Imageopto-Api) {
      set beresp.ttl = 2592000s; # 30 days
      set beresp.http.Cache-Control = "max-age=2592000, public";
    }
  }

  return(deliver);
}

sub vcl_error {
#FASTLY error

  # Effect redirect to append slash
  if (obj.status == 613 && obj.response == "redirect slash") {
    set obj.status = 301;
    set obj.http.Location = "https://" + req.http.host + req.url.path + "/" + if (std.strlen(req.url.qs) > 0, "?" req.url.qs, "");
    return(deliver);
  }

  # Effect redirect to drop index.html
  if (obj.status == 614 && obj.response == "redirect index.html") {
    set obj.status = 301;
    set obj.http.Location = "https://" + req.http.host + regsub(req.url.path, "/index\.html$", "/") + if (std.strlen(req.url.qs) > 0, "?" req.url.qs, "");
    return(deliver);
  }

  # Effect return current bucket
  if (obj.status == 615 && obj.response == "return bucket.txt") {
    set obj.status = 200;

    declare local var.awsS3Bucket STRING;
    declare local var.response STRING;

    set var.awsS3Bucket = match_bucket(req.http.host);
    set var.response = var.awsS3Bucket + " (fastly serverless)";

    synthetic var.response;
    return(deliver);
  }

  return(deliver);
}

sub vcl_deliver {
  # Effect 404 when no match in pages dictionaries
  if (req.http.x-not-found-in-pages == "trouble in paradise") {
    set resp.status = 404;
    set resp.response = "Not Found";
    return(deliver);
  }

#FASTLY deliver

  return(deliver);
}

sub vcl_log {
#FASTLY log
}
