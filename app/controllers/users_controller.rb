class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [ :index, :show, :test_login ]
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
  
  def test_login
    respond_with(nil)
  end
  
  def show
    respond_with(nil)
  end
  
  def logout
    respond_with(nil)
  end
end
