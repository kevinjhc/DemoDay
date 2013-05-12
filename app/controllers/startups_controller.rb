class StartupsController < ApplicationController
  def index
    @startups = Startup.all
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(params[:startup])
    @startup.save
    redirect_to startups_path
  end

  def update
  end

  def destroy
    @startup = Startup.find(params[:startup])
    @startup.destroy
    redirect_to startups_path
  end

  def follow
    angellist_id = params[:angellist_id]

    require 'net/http'
    $angel_api = Net::HTTP.new("api.angel.co", 443)
    $angel_api.use_ssl = true

    request = Net::HTTP::Post.new("/1/follows")
    request.set_form_data({"access_token" => current_user.oauth_token, "type" => "startup", "id" => angellist_id})
    $angel_api.request(request)

    redirect_to root_path
  end
end