class Cardy.Models.Deck extends Backbone.Model
  paramRoot: 'deck'
  urlRoot: 'decks'

class Cardy.Collections.Decks extends Backbone.Collection
  model: Cardy.Models.Deck
  url: '/decks'
  parse: (resp) ->
    this.query = resp.query
    this.per_page = resp.per_page
    this.total_pages = resp.total_pages
    this.total_entries = resp.total_entries
    return resp.decks
