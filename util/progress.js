export function progressLine(heading) {
  process.stdout.write(heading + `...`);

  return {
    update(result) {
      process.stdout.write(`\r\x1b[K${heading}: ${result}`);
    },

    done(result) {
      process.stdout.write(`\r\x1b[K${heading}: ${result}\n`);
    },
  };
}
