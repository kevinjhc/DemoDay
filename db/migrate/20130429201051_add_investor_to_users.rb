class AddInvestorToUsers < ActiveRecord::Migration
  def up
    add_column :users, :investor, :boolean, :default => false
  end

  def down
    remove_column :users, :investor
  end
end
