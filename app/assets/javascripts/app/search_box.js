searchServices = function (allDiv) {
  var searchTerm = document.getElementById('search-term').value;
  var searchResults = document.getElementById('search-results');
  var allElements = document.getElementById(allDiv);

  if(searchTerm.length > 0) {
    var elements = document.getElementsByClassName('div-content');
    var searchResultsContent = document.getElementById('search-results-content');

    allElements.style.display = 'none';
    searchResults.style.display = 'block';

    $(searchResultsContent).html('');
    jQuery.each( elements, function( i, element ) {
      if (element.dataset.name.indexOf(searchTerm.toLowerCase()) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      }
    });
  } else {
    allElements.style.display = 'block';
    searchResults.style.display = 'none';
  }
}

