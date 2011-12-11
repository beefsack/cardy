class UserDeckSessionCard < ActiveRecord::Base
  belongs_to :user_deck_session
  belongs_to :card
  has_many :user_deck_session_card_attempts
end
