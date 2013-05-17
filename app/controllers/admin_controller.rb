class AdminController < ApplicationController
  before_filter :signed_in?

  def index
  end

  def become_admin
    password = 'tsdemoday'
    if params[:password] == password
      current_user.update_attribute(:admin, true)
      redirect_to root_path
    else
      redirect_to admin_path, alert: 'Incorrect Password'
    end
  end
end