function filter_table_by_severity(tableId) {
  var filter = document.getElementById('severity_filter');
  var selectedClass = filter.value;
  var rows = document.querySelectorAll(`#${tableId} > :not(thead) > tr`);

  function containsAny(arr, ...args) {
    return args.some(a => arr.contains(a))
  }

  rows.forEach(function(row) {
    switch (selectedClass) {
      case 'warning':
        row.style.display = containsAny(row.classList, 'warning', 'error', 'fatal') ? '' : 'none';
        break;
      case 'error':
        row.style.display = containsAny(row.classList, 'error', 'fatal') ? '' : 'none';
        break;
      case 'fatal':
        row.style.display = row.classList.contains('fatal') ? '' : 'none';
        break;
      case 'info':
      default:
        row.style.display = '';
    }
  });
}