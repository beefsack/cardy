class UserDeckSessionsController < ApplicationController
  def index
    raise "Must specify user_id or deck_id." if params[:user_id].nil? and params[:deck_id].nil?
    conditions = {}
    conditions[:user_id] = params[:user_id].to_i unless params[:user_id].nil?
    conditions[:deck_id] = params[:deck_id].to_i unless params[:deck_id].nil?
    respond_with(@user_deck_sessions = UserDeckSession.all(:conditions => conditions))
  end

  def create
    @user_deck_session = UserDeckSession.new(params[:user_deck_session])
    if @user_deck_session.save
      redirect_to @user_deck_session
    else
      respond_with @user_deck_session.errors, :status => :bad_request, :location => nil
    end
  end

  def show
    @user_deck_session = UserDeckSession.find params[:id]
    respond_with @user_deck_session
  end

  def update
    @user_deck_session = UserDeckSession.find params[:id]
    if @user_deck_session.update_attributes(params[:user_deck_session])
      redirect_to @user_deck_session
    else
      respond_with @user_deck_session.errors, :status => :bad_request, :location => nil
    end
  end

  def destroy
    @user_deck_session = UserDeckSession.find params[:id]
    @user_deck_session.destroy
    respond_with nil
  end
end
