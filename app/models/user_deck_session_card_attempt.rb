class UserDeckSessionCardAttempt < ActiveRecord::Base
  belongs_to :user_deck_session_card
  belongs_to :card # Redundant column, to avoid deep joins
end
