class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :destroy_session
  
  def destroy_session
    sign_out :user
  end
end
