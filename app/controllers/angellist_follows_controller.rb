class AngellistFollowsController < ApplicationController
  def create
    follow_startup
  end

  def follow_startup
    angellist_id = params[:angellist_id]
    startup = params[:startup_id].to_i

    require 'net/http'
    $angel_api = Net::HTTP.new("api.angel.co", 443)
    $angel_api.use_ssl = true

    request = Net::HTTP::Post.new("/1/follows")
    request.set_form_data({"access_token" => current_user.oauth_token, "type" => "startup", "id" => angellist_id})
    $angel_api.request(request)

    current_user.angellist_follows.create({ startup_id: startup, user_id: current_user.id })
  end

end
