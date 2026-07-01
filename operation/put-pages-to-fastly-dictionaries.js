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

const max_dictionary_size = 1000;

import {progressLine} from '#progress';
import {readResult, writeResult} from '#result';

const hsmusicResult = await readResult('pages-in-hsmusic-output');
const fastlyResult = await readResult('pages-in-fastly-dictionaries');

const inverse = Object.create(null);
for (const [dictionary, {items}] of Object.entries(fastlyResult.dictionaries)) {
  for (const item of Object.keys(items)) {
    if (item in inverse) {
      inverse[item].push(dictionary);
    } else {
      inverse[item] = [dictionary];
    }
  }
}

const hsmusicKeys = Object.keys(hsmusicResult);

const dictionaryRoom =
  Object.fromEntries(
    Object.entries(fastlyResult.dictionaries)
      .map(([id, {items}]) =>
       [id,
        max_dictionary_size - Object.keys(items).length]));

const ops = [];

for (const key of Object.keys(fastlyResult.all).sort()) {
  const deleteFromDictionaries =
    (hsmusicKeys.includes(key)
      ? inverse[key].slice(1)
      : inverse[key]);

  for (const dictionary of deleteFromDictionaries) {
    ops.push({
      dictionary,
      op: 'delete',
      item_key: key,
    });

    dictionaryRoom[dictionary]++;
  }

  if (hsmusicKeys.includes(key)) {
    inverse[key] = inverse[key][0];
  } else {
    delete inverse[key];
  }
}

const dictionariesWithRoom = [];
for (const [id, room] of Object.entries(dictionaryRoom)) {
  if (room >= 1) {
    dictionariesWithRoom.push([id, room]);
  }
}

let outOfRoom = 0;
for (const [key, value] of Object.entries(hsmusicResult)) {
  const dictionary = inverse[key];

  if (dictionary) {
    if (fastlyResult.dictionaries[dictionary].items[key] !== value) {
      ops.push({
        dictionary,
        op: 'update',
        item_key: key,
        item_value: value,
      });
    }
  } else {
    const firstWithRoom = dictionariesWithRoom[0];
    if (firstWithRoom) {
      const dictionary = firstWithRoom[0];
      if (--firstWithRoom[1] === 0) {
        dictionariesWithRoom.shift();
      }

      ops.push({
        dictionary,
        op: 'create',
        item_key: key,
        item_value: value,
      });
    } else {
      outOfRoom++;
    }
  }
}

if (outOfRoom) {
  const size = max_dictionary_size;
  const dicts = Math.ceil(outOfRoom / size);
  const total = hsmusicKeys.length;
  const totalDicts = Math.ceil(total / size);
  const currentDicts = Object.keys(fastlyResult.dictionaries).length;
  console.error(`out of room, need ${outOfRoom} more item slots`);
  console.error(`that's ${dicts} more dictionaries at ${size} items each`);
  console.error(`total needed: ${totalDicts} dictionaries, ${total} items`);
  console.error(`currently available: ${currentDicts} dictionaries`);
  process.exit(1);
}

await writeResult('fastly-dictionary-bulk-ops', {
  service_id,
  ops,
});

console.log(`review, then run execute-fastly-dictionary-bulk-ops.js`);;
console.log(`less result/fastly-dictionary-bulk-ops.json`);
