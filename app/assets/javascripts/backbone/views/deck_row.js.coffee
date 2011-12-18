class Cardy.Views.DeckRow extends Backbone.View
  tagName: 'a'
  className: 'deck-row'
  initialize: ->
    this.model.bind 'change', this.render, this
    this.model.bind 'destroy', this.remove, this
  render: ->
    ref = $(this.el)
    ref.attr 'href', 'deck.html?id=' + this.model.get('id')
    ref.attr 'data-role', 'button'
    ref.html this.model.get('name')
    ref.trigger 'create'
    return this
