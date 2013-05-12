class RemoveCeoImageFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :ceo_img_path
  end

  def down
    add_column :startups, :ceo_img_path, :string
  end
end
