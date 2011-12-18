class Cardy.Views.DeckList extends Backbone.View
  tagName: 'div'
  className: 'deck-list'
  render: ->
    ref = $(this.el)
    ref.attr 'data-role', 'controlgroup'
    ref.html ''
    this.collection.each (deck) ->
      view = new Cardy.Views.DeckRow(model: deck)
      ref.append view.render().el
      ref.trigger 'create'
    return this
