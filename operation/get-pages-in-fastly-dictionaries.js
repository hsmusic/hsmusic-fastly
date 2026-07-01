import Fastly from 'fastly';
import services from '#fastly-services';

const service_code = process.env.HSMUSIC_SERVICE;
if (!service_code) {
  console.error(`Expected HSMUSIC_SERVICE to be set`);
  process.exit(1);
}

if (!(service_code in services)) {
  console.error(`Expected HSMUSIC_SERVICE to be one of:`);
  console.error(Object.keys(services).join(' '));
  process.exit(1);
}

const service_id = services[service_code].id;
const version_id = services[service_code].version;

import {iteratePages} from '#iterate-pages';
import {progressLine} from '#progress';
import {writeResult} from '#result';

import '#authenticate-fastly';

const dictionary_api = new Fastly.DictionaryApi();
const dictionary_item_api = new Fastly.DictionaryItemApi();

const dictionaries =
  await dictionary_api.listDictionaries({service_id, version_id});

const pagesDictionaries =
  dictionaries
    .filter(({name}) => name.startsWith('pages'));

console.log(`got ${pagesDictionaries.length} pages dictionaries`);

const result = {
  all: {},
  dictionaries: {},
};

for (const dictionary of pagesDictionaries) {
  const dictionary_id = dictionary.id;

  result.dictionaries[dictionary_id] = {
    name: dictionary.name,
    items: {},
  };

  const items_query = options =>
    dictionary_item_api.listDictionaryItems({
      service_id,
      dictionary_id,
      ...options,
    });

  const line = progressLine(`${dictionary.name} (${dictionary.id})`);

  let count = 0;
  for await (const {item, advanced} of iteratePages(items_query)) {
    const key = item.item_key;
    const value = item.item_value;
    result.all[key] = value;
    result.dictionaries[dictionary_id].items[key] = value;
    count++;
    if (advanced) {
      line.update(`${count} items`);
    }
  }

  line.done(`${count} items`);
}

await writeResult('pages-in-fastly-dictionaries', result);
