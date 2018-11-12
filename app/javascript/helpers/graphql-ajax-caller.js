function graphqlAjaxCaller(graphqlQuery, _successCallback, _errorCallback) {
  fetch('/graphql', {
    method: 'POST',
    headers: new Headers({
      'Content-Type': 'application/json',
      'X-CSRF-Token': document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute('content'),
      'X-Requested-With': 'XMLHttpRequest',
    }),
    credentials: 'same-origin',
    body: JSON.stringify({
      query: graphqlQuery,
      type: 'app',
    }),
  }).then(res => res.json())
    .then((res) => {
      if (res.errors) {
        _errorCallback(res.errors);
      } else {
        _successCallback(res);
      }
    }, ((res) => {
        _errorCallback(res);
      }));
}
export default graphqlAjaxCaller;
