class Startup < ActiveRecord::Base
  attr_accessible :angellist_id, :bio, :ceo_name, :email, :name, :presentation_order, :ceo_angellist_id, :domain_url, :ceo_slug

  def img_url
    self.name.downcase + '.jpg'
  end
  
end
