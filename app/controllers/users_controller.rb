class UsersController < ApplicationController
  respond_to :json, :xml
  before_filter :authenticate_user!, :only => [ :index, :show ]
  def index
    respond_with(@users = User.all)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      respond_with(@user)
    else
      respond_with(@user.errors, :status => :bad_request, :location => nil)
    end
  end
end
