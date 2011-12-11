class DeckCard < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card
  
  validates :card_id, :presence => true
  validates :deck_id, :presence => true
end
