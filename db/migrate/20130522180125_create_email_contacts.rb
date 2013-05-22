class CreateEmailContacts < ActiveRecord::Migration
  def change
    create_table :email_contacts do |t|
      t.integer :startup_id
      t.integer :user_id

      t.timestamps
    end
  end
end
