class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.integer :order
      t.string :email
      t.string :ceo_name
      t.string :ceo_img_path
      t.string :ceo_email
      t.integer :angellist_id

      t.timestamps
    end
  end
end
