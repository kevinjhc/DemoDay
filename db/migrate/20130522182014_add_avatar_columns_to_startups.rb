class AddAvatarColumnsToStartups < ActiveRecord::Migration
  def up
    add_attachment :startups, :avatar
  end

  def down
    remove_attachment :startups, :avatar
  end
end