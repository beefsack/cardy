class Cardy.Views.DeckList extends Backbone.View
  tagName: 'ul'
  className: 'deck-list'
  render: ->
    ref = $(this.el)
    ref.html ''
    this.collection.each (deck) ->
      view = new Cardy.Views.DeckRow(model: deck)
      ref.append view.render().el
    return this
