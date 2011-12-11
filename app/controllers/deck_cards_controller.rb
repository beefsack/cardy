class DeckCardsController < ApplicationController
  def index
    conditions = {}
    conditions[:deck_id] = params[:deck_id] unless params[:deck_id].nil?
    conditions[:card_id] = params[:card_id] unless params[:card_id].nil?
    if conditions.length == 0
      respond_with({:error => "You must specify a condition, such as deck_id or card_id."},
        :status => :bad_request, :location => nil)
    elsif
      respond_with(@deck_cards = DeckCard.all(:conditions => conditions))
    end
  end
  
  def create
    @deck_card = DeckCard.new(params[:deck_card])
    if @deck_card.save
      redirect_to @deck_card
    else
      respond_with(@deck_card.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def show
    respond_with(@deck_card = DeckCard.find(params[:id]))
  end
  
  def update
    @deck_card = DeckCard.find(params[:id])
    if @deck_card.update_attributes(params[:deck_card])
      redirect_to @deck_card
    else
      respond_with(@deck_card.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def destroy
    @deck_card = DeckCard.find(params[:id])
    @deck_card.destroy
    respond_with(nil)
  end
end
