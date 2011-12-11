class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :destroy_session
  respond_to :json, :xml
  
  def destroy_session
    sign_out :user
  end
end
