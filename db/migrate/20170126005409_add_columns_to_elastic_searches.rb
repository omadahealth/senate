class AddColumnsToElasticSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :elastic_searches, :user, :string
    add_column :elastic_searches, :password, :string
    add_column :elastic_searches, :host, :string
    add_column :elastic_searches, :port, :integer
  end
end
