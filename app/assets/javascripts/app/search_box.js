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
      if (element.dataset.customerFirstName.indexOf(removeAccents(searchTerm)) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.customerLastName.indexOf(removeAccents(searchTerm)) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.customerFullName.indexOf(removeAccents(searchTerm)) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.descriptionMo.indexOf(searchTerm.toLowerCase()) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.immat.indexOf(searchTerm.replace(/-/g, '')) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.partsName.indexOf(removeAccents(searchTerm)) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      } else if (element.dataset.partsRef.indexOf(searchTerm) > -1) {
        $(element).clone().appendTo(searchResultsContent)
      }
    });
  } else {
    allElements.style.display = 'block';
    searchResults.style.display = 'none';
  }
}

removeAccents = function(s){
                        var r=s.toLowerCase();
                        r = r.replace(new RegExp("[àáâãäå]", 'g'),"a");
                        r = r.replace(new RegExp("æ", 'g'),"ae");
                        r = r.replace(new RegExp("ç", 'g'),"c");
                        r = r.replace(new RegExp("[èéêë]", 'g'),"e");
                        r = r.replace(new RegExp("[ìíîï]", 'g'),"i");
                        r = r.replace(new RegExp("ñ", 'g'),"n");
                        r = r.replace(new RegExp("[òóôõö]", 'g'),"o");
                        r = r.replace(new RegExp("œ", 'g'),"oe");
                        r = r.replace(new RegExp("[ùúûü]", 'g'),"u");
                        r = r.replace(new RegExp("[ýÿ]", 'g'),"y");
                        return r;
                };