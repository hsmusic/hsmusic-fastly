import Fastly from 'fastly';

const max_ops_per_update = 250;

import '#authenticate-fastly';

import {readResult, writeResult} from '#result';
import {progressLine} from '#progress';

const config = await readResult('fastly-dictionary-bulk-ops');

const service_id = config.service_id;
const dictionary_ops = Object.groupBy(config.ops, op => op.dictionary);

const dictionary_item_api = new Fastly.DictionaryItemApi();

const errors = [];
const result = {status: 'working', errors};

const updateResult = async () => {
  result.errorCount = errors.length;
  await writeResult('status-execute-fastly-dictionary-bulk-ops', result);
};

let step = 0, num_steps = Object.keys(dictionary_ops).length;
for (const [dictionary_id, ops] of Object.entries(dictionary_ops)) {
  const line = progressLine(`(${++step}/${num_steps}) ${dictionary_id}`);

  for (
    let i = 0, list;
    list = ops.slice(i, i + max_ops_per_update), list.length;
    i += max_ops_per_update
  ) {
    const items =
      list.map(item => {
        const item2 = {...item};
        delete item2.dictionary_id;
        return item2;
      });

    try {
      await dictionary_item_api.bulkUpdateDictionaryItem({
        service_id,
        dictionary_id,
        bulk_update_dictionary_list_request: {items},
      });
    } catch (error) {
      const niceError =
        (error.status
          ? [error.status, error.body]
          : error.toString());

      errors.push({service_id, dictionary_id, items, error: niceError});
      console.error(error.status ? niceError : error);
    }

    line.update(`done ${i + max_ops_per_update}/${ops.length} ops`);
    await updateResult();
  }

  line.done(`done ${ops.length} ops`);
}

result.status = 'done';
await updateResult();
