class RemoveOauthexpiresatFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :oauth_expires_at
  end

  def down
    add_column :users, :oauth_expires_at, :datetime
  end
end
