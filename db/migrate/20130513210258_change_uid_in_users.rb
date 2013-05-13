class ChangeUidInUsers < ActiveRecord::Migration
  def up
    change_column :users, :uid, :integer
  end

  def down
    change_column :users, :uid, :string
  end
end
