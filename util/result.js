import {readFile, writeFile} from 'node:fs/promises';
import * as path from 'node:path';
import {fileURLToPath} from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const file = name =>
  path.join(__dirname, '..', 'result', name + '.json');

const format = result =>
  JSON.stringify(result, null, 2);

const parse = string =>
  JSON.parse(string);

export async function readResult(resultName) {
  return parse(await readFile(file(resultName)));
}

export async function writeResult(resultName, result) {
  await writeFile(file(resultName), format(result));
}
