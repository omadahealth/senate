class CreateElasticSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :elastic_searches do |t|
      t.integer :application_environment_id

      t.timestamps
    end
  end
end
