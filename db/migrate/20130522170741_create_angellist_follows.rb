class CreateAngellistFollows < ActiveRecord::Migration
  def change
    create_table :angellist_follows do |t|
      t.integer :startup_id
      t.integer :user_id

      t.timestamps
    end
  end
end
