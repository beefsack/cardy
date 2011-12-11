class DecksController < ApplicationController
  def index
    respond_with(@decks = Deck.all)
  end
  
  def create
    @deck = Deck.new(params[:deck])
    if @deck.save
      redirect_to @deck
    else
      respond_with(@deck.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def show
    respond_with(@deck = Deck.find(params[:id]))
  end
  
  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(params[:deck])
      redirect_to @deck
    else
      respond_with(@deck.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    respond_with(nil)
  end
  
  def cards
    @deck = Deck.find(params[:deck_id])
    respond_with(@cards = Deck.cards)
  end
end
