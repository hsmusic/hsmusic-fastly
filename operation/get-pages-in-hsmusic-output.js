import * as path from 'node:path';

import {writeResult} from '#result';
import {traverse} from '#traverse';

const outPath = process.env.HSMUSIC_OUT;
if (!outPath) {
  console.error(`Expected HSMUSIC_OUT to be set`);
  process.exit(1);
}

const result = {};

const paths =
  await Array.fromAsync(
    traverse(outPath, {
      pathStyle: 'posix',
      prefixPath: '/',
    }));

paths.sort(); // just in case

console.log(`got ${paths.length} file paths in hsmusic output directory`);

let resultCount = {
  'localized-with-oembed': 0,
  'localized': 0,
  'file': 0,
};

const hsmusicDirname = p => {
  const match = p.match(/^\/es/);
  if (match) {
    return hsmusicDirname(p.slice(match[0].length));
  }

  if (path.dirname(p) === '/') {
    return '';
  } else {
    return path.dirname(p);
  }
};

for (let [dirname, filepaths] of Map.groupBy(paths, hsmusicDirname)) {
  const filenames = new Set(filepaths.map(p => path.basename(p)));
  const has = filenames.has.bind(filenames);

  filepaths = new Set(filepaths);

  const drop = filename => {
    for (const p of filepaths) {
      if (path.basename(p) === filename) {
        filepaths.delete(p);
      }
    }
  };

  drop('.DS_Store');

  if (has('index.html') && has('oembed.json')) {
    drop('index.html');
    drop('oembed.json');
    result[dirname + '/'] = 'localized-with-oembed';
    resultCount['localized-with-oembed']++;
  } else if (has('index.html')) {
    drop('index.html');
    result[dirname + '/'] = 'localized';
    resultCount['localized']++;
  }

  for (const filepath of filepaths) {
    result[filepath] = 'file';
    resultCount['file']++;
  }
}

console.log(`recording as ${Object.keys(result).length} page paths:`);

for (const [type, count] of Object.entries(resultCount)) {
  console.log(` - ${type}: ${count}`);
}

await writeResult('pages-in-hsmusic-output', result);
