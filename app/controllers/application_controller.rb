class ApplicationController < ActionController::Base
  protect_from_forgery

  def oauth_token
    @oauth_token = session[:oauth_token]
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end