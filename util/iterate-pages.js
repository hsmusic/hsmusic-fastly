const per_page = 100;

export async function* iteratePages(callback) {
  for (let items, page = 1; !items || items.length === per_page; page++) {
    items =
      await callback({
        direction: 'ascend',
        per_page,
        page,
      });

    let advanced = page !== 1;
    for (const item of items) {
      yield {item, advanced};
      advanced = false;
    }
  }
}
