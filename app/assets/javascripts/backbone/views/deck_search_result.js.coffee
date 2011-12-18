class Cardy.Views.DeckSearchResult extends Backbone.View
  className: 'deck-search-result'
  render: ->
    ref = $(@el)
    ref.append $('<h3>Found ' + @collection.total_entries + ' result(s).</h3>')
    deck_list = new Cardy.Views.DeckList
      collection: @collection
    ref.append deck_list.render().el
    return this
