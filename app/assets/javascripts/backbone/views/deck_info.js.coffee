class Cardy.Views.DeckInfo extends Backbone.View
  className: 'deck-info'
  render: ->
    ref = $(@el)
    ref.html ''
    ref.append $('<h2>' + @model.get('name') + '</h2>')
    return this
