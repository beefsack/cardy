class Deck < ActiveRecord::Base
  has_many :deck_cards
  has_many :cards, :through => :deck_cards
  has_many :user_deck_sessions
  
  validates :name, :presence => true
  
  def self.search(query, options = {})
    paginate(:page => options[:page],
      :conditions => ['name LIKE ?', "%#{query}%"])
  end
end
