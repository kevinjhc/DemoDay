class AddInfoToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :domain_url, :string
    add_column :startups, :ceo_slug, :string
  end
end
