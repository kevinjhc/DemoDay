class EmailContact < ActiveRecord::Base
  attr_accessible :startup_id, :user_id

  belongs_to :user
end