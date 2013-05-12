class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :bio, :string
  end
end
