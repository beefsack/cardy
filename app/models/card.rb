class Card < ActiveRecord::Base
  has_many :deck_cards
  has_many :decks, :through => :deck_cards
  has_many :user_deck_session_cards
end
