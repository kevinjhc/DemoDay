class User < ActiveRecord::Base
  attr_accessible :name, :oauth_token, :provider, :uid, :investor

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.investor = auth.info.investor
      user.save!
    end
  end

end