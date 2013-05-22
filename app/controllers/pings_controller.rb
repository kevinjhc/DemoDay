class PingsController < ApplicationController

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

  def send_email
    @startup = Startup.find(params[:id])

    UserMailer.contact_confirmation(@startup, current_user).deliver
    UserMailer.startup_email(@startup, current_user).deliver

    redirect_to root_path
  end

end