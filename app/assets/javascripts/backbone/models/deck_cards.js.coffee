class Cardy.Models.DeckCard extends Backbone.Model
  paramRoot: 'deck_card'
  urlRoot: 'deck_cards'

class Cardy.Collections.DeckCards extends Backbone.Collection
  model: Cardy.Models.DeckCard
  url: '/deck_cards'
