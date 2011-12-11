class DeckCardsController < ApplicationController
  def index
    conditions = {}
    conditions[:deck_id] = params[:deck_id] unless params[:deck_id].nil?
    conditions[:card_id] = params[:card_id] unless params[:card_id].nil?
    respond_with(@deck_cards = DeckCard.all(:conditions => conditions))
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
