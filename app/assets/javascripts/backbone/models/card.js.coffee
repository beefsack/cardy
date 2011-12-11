class Cardy.Models.Card extends Backbone.Model
  paramRoot: 'card'
  urlRoot: 'cards'

class Cardy.Collections.Cards extends Backbone.Collection
  model: Cardy.Models.Card
  url: '/cards'
