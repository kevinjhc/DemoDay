class AddBioToStartups < ActiveRecord::Migration
  def up
    add_column :startups, :bio, :text
  end

  def down
    remove_column :startups, :bio
  end
end
