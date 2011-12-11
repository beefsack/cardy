class DeckChild < ActiveRecord::Base
  belongs_to :deck
  belongs_to :parent, :class_name => "Deck",
    :foreign_key => "parent_deck_id"
end
