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

  def angellist_user?
    current_user.provider == 'angellist'
  end
  helper_method :angellist_user?

  protected

  def admin?
    current_user && current_user.admin
  end
  helper_method :admin?

  def authorize
    unless admin?
      redirect_to root_path
      false
    end
  end

  def signed_in?
    unless current_user
      redirect_to root_path
      false
    end
  end

end