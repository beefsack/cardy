class UsersController < ApplicationController
  respond_to :json, :xml
  before_filter :authenticate_user!
  def index
    respond_with(@users = User.all)
  end
end
