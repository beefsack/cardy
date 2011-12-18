class Cardy.Views.DeckRow extends Backbone.View
  tagName: 'li'
  className: 'deck-row'
  events:
    click: 'openDeck'
  initialize: ->
    this.model.bind 'change', this.render, this
    this.model.bind 'destroy', this.remove, this
  render: ->
    $(this.el).html this.model.get('name')
    return this
  openDeck: ->
    alert this.model.get('id')
