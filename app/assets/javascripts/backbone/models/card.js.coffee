class Cardy.Models.Card extends Backbone.Model
  paramRoot: 'card'
  url: '/cards'

class Cardy.Collections.CardsCollection extends Backbone.Collection
  model: Cardy.Models.Card
  url: '/cards'
