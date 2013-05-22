class Startup < ActiveRecord::Base
  attr_accessible :angellist_id, :bio, :ceo_name, :email, :name, :presentation_order, :ceo_angellist_id, :domain_url, :ceo_slug, :avatar, :avatar_file_name
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # def img_url
  #   self.name.downcase + '.jpg'
  # end
  
end
