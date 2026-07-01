import {readdir, stat} from 'node:fs/promises';
import * as path from 'node:path';

export async function* traverse(rootPath, {
  pathStyle = 'device',
  prefixPath = rootPath,
} = {}) {
  const pathJoinDevice = path.join;

  const pathJoinStyle =
    (pathStyle === 'device' ? path.join
   : pathStyle === 'posix' ? path.posix.join
   : pathStyle === 'win32' ? path.win32.join
                           : null);

  if (!pathJoinStyle) {
    throw new Error(`Expected pathStyle to be device, posix, or win32`);
  }

  async function* recursive(...into) {
    const here = pathJoinDevice(rootPath, ...into);
    for (const name of await readdir(here)) {
      const down = pathJoinDevice(rootPath, ...into, name);
      const stats = await stat(down);
      if (stats.isDirectory()) {
        yield* recursive(...into, name);
      } else if (stats.isFile()) {
        yield pathJoinStyle(prefixPath, ...into, name);
      }
    }
  }

  yield* recursive();
}
