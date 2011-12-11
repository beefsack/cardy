class CardsController < ApplicationController
  def index
    respond_with(@cards = Card.all)
  end
  
  def create
    @card = Card.new(params[:card])
    if @card.save
      redirect_to @card
    else
      respond_with(@card.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def show
    respond_with(@card = Card.find(params[:id]))
  end
  
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      redirect_to @card
    else
      respond_with(@card.errors, :status => :bad_request, :location => nil)
    end
  end
  
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    respond_with(nil)
  end
end
