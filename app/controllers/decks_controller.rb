class DecksController < ApplicationController
  def index
    @decks = Deck.search params[:query], params
    response_data = {
      :decks => @decks,
      :query => params[:query],
      #:page => @decks.page,
      :per_page => @decks.per_page,
      :total_pages => @decks.total_pages,
      :total_entries => @decks.total_entries
    }
    respond_with(response_data)
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
    @deck = Deck.find params[:id]
    # Calculate card count
    @deck[:card_count] = @deck.cards.size
    respond_with @deck
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
