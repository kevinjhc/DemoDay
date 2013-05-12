class Startup < ActiveRecord::Base
  attr_accessible :angellist_id, :bio, :ceo_name, :email, :name, :order

  def img_url
    self.name.downcase + '.jpg'
  end

end
