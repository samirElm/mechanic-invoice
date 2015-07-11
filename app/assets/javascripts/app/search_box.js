searchServices = function (allDiv) {
  var searchTerm = document.getElementById('search-term').value;
  var searchResults = document.getElementById('search-results');
  var allElements = document.getElementById(allDiv);

  if(searchTerm.length > 0) {
    var elements = document.getElementsByClassName('div-content');
    var searchResultsContent = document.getElementById('search-results-content');
    var noResultsFound = document.getElementById('no-results-found');


    allElements.style.display = 'none';
    searchResults.style.display = 'block';

    $(searchResultsContent).html('');
    jQuery.each( elements, function( i, element ) {
      if (element.dataset.customerName.indexOf(searchTerm.toLowerCase()) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.descriptionMo.indexOf(searchTerm.toLowerCase()) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.immat.indexOf(searchTerm.replace(/-/g, '')) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      }
    });
  } else {
    allElements.style.display = 'block';
    searchResults.style.display = 'none';
  }
}