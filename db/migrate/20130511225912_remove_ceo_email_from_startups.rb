class RemoveCeoEmailFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :ceo_email
  end

  def down
    add_column :startups, :ceo_email, :string
  end
end
