$('#searchPage').live 'pageshow', ->
  query = get_param "query"
  $(this).find('#query').val window.get_param('query')
  decks = new Cardy.Collections.Decks
  decks = decks.fetch
    data:
      query: query
    success: (collection, response) ->
      collection.each (deck) ->
        alert deck.get('name')