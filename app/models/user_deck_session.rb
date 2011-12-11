class UserDeckSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :user_deck_session_cards
end
