class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation

  validates :password, :presence => true, :on => :create
  validates :name, :presence => true
  validates :name, :uniqueness => true

  emailRegex = /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :email, :format => { :with => emailRegex }
end