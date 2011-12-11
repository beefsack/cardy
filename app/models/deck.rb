class Deck < ActiveRecord::Base
  has_many :deck_cards
  has_many :cards, :through => :deck_cards
  has_many :user_deck_sessions
end
