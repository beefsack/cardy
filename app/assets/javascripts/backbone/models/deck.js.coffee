class Cardy.Models.Deck extends Backbone.Model
  paramRoot: 'deck'
  urlRoot: 'decks'

class Cardy.Collections.Decks extends Backbone.Collection
  model: Cardy.Models.Deck
  url: '/decks'
