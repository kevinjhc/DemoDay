class RenameOrderInStartups < ActiveRecord::Migration
  def up
    rename_column :startups, :order, :presentation_order
  end

  def down
    rename_column :startups, :presentation_order, :order
  end
end
