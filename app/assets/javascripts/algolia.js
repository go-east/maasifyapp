$(document).ready(function() {
  var search = instantsearch({
    appId: 'OB9KRZQ2SS',
    apiKey: '1261c3ce95f4e8c68e375a0b673d8e59',
    indexName: 'Hack',
    urlSync: true
  });

  search.addWidget(
    instantsearch.widgets.searchBox({
      container: '#search-input',
      placeholder: 'Chercher un hack'
    })
  );


  search.addWidget(
    instantsearch.widgets.refinementList({
      container: '#categorie_une',
      attributeName: 'categorie_une',
      searchForFacetValues: {
        placeholder: 'Chercher une catégorie'
      },
      templates: {
        header: '<h3>Catégories</h3>',
      }
    })
  );

  search.addWidget(
    instantsearch.widgets.hits({
      container: '#results',
      templates: {
        item: function (hit) {
          return '' +
            '<li>' +
            '  ' + hit._highlightResult.titre.value + ',' +
            '  ' + hit._highlightResult.categorie_une.value + ' - ' +
            '  ' + hit.rating +
            '</li>';
        }
      },
      transformData: {
        item: function (hit) {
          // We just call this function to log the data so that
          // you can know what you can use in your item template
          console.log(hit);
          return hit;
        }
      }
    })
  );

  search.start();
});