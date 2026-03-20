function filter_table_by_input(tableId) {
  const filter = document.getElementById('text_filter_input');
  const specifiedText = filter.value;
  const rows = document.querySelectorAll(`#${tableId} > :not(thead) > tr`);

  const containsText = (cell) => specifiedText == "" || cell.textContent.indexOf(specifiedText) >= 0;

  rows.forEach(function(row) {
    const rowContainsText = specifiedText == "" || Array.from(row.cells).some(containsText);
    row.style.display = rowContainsText ? '' : 'none';
  });
 }