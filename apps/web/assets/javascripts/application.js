document.addEventListener('DOMContentLoaded', function(event) {
  var selector = 'a[data-method=delete]';
  var elements = document.querySelectorAll(selector);
  Array.prototype.forEach.call(elements, function(element, i) {
    element.onclick = function() {
      var xhr = new XMLHttpRequest();
      xhr.open('DELETE', element.href);
      xhr.onload = function() {
        window.location.reload();
      };
      xhr.send();
      return false;
    }
  });
});
