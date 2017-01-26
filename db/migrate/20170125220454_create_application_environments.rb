class CreateApplicationEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :application_environments do |t|
      t.integer :application_id
      t.integer :environment_id
      t.string :rails_env

      t.timestamps
    end
  end
end
