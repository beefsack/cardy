$('#search-page').live 'pageshow', ->
  query = get_param "query"
  $(this).find('#query').val window.get_param('query')
  decks = new Cardy.Collections.Decks
  decks = decks.fetch
    data:
      query: query
    success: (collection, response) ->
      view = new Cardy.Views.DeckSearchResult
        collection: collection
        el: $('#search-results').get()
      view.render()

$('#deck-page').live 'pageshow', ->
  deck = new Cardy.Models.Deck
    id: get_param 'id'
  deck.fetch
    success: (deck) ->
      view = new Cardy.Views.DeckInfo
        model: deck
        el: $('#deck-information').get()
      view.render()
