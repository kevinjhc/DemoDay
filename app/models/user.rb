class User < ActiveRecord::Base
  attr_accessible :name, :oauth_token, :provider, :uid, :investor, :email, :bio, :linkedin, :twitter

  has_many :angellist_follows
  has_many :email_contacts

  def self.from_omniauth(auth)
    auth[:uid] = auth[:uid].to_s
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid.to_s
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.investor = auth.info.investor
      user.twitter = auth.info.twitter_url
      user.linkedin = auth.info.linkedin_url
      user.bio = auth.info.bio
      user.save!
    end
  end

end