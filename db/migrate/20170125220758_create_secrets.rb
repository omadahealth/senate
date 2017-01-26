class CreateSecrets < ActiveRecord::Migration[5.0]
  def change
    create_table :secrets do |t|
      t.integer :application_environment_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
