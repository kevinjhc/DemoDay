class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:oauth_token] = user.oauth_token
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session[:oauth_token] = nil
    redirect_to root_url
  end
end

=begin
raise env["omniauth.auth"].to_yaml
--- !ruby/hash:OmniAuth::AuthHash
provider: angellist
uid: 292385
info: !ruby/hash:OmniAuth::AuthHash::InfoHash
  name: Kevin Chang
  email: kevinjhc@gmail.com
  bio: HackStar @techstars, @SnackStars, @StartupInst Graduate
  blog_url: 
  online_bio_url: http://kevinjhc.com/boston
  twitter_url: http://twitter.com/#!/kevinjhc
  facebook_url: 
  linkedin_url: 
  follower_count: 0
  angellist_url: https://angel.co/kevinjhc
  image: https://angel.co/images/shared/nopic.png
  locations: []
  roles: []
credentials: !ruby/hash:OmniAuth::AuthHash
  token: b76c43350bc40653221230568ae0097c
  expires: false
extra: !ruby/hash:OmniAuth::AuthHash {}
=end