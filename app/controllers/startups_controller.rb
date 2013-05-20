class StartupsController < ApplicationController

  before_filter :authorize, :except => [:follow, :send_email]

  # You can only access this page as an admin. Else it redirects you to root
  def index
    redirect_to root_path
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(params[:startup])
    @startup.save
    redirect_to startups_path
  end

  def edit
    @startup = Startup.find(params[:id])
  end

  def update
    @startup = Startup.find(params[:id])
    @startup.update_attributes(params[:startup])
    redirect_to startups_path
  end

  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy
    redirect_to startups_path
  end

end