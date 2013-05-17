class AddCeoId < ActiveRecord::Migration
  def up
    add_column :startups, :ceo_angellist_id, :integer
  end

  def down
    remove_column :startups, :ceo_angellist_id
  end
end
