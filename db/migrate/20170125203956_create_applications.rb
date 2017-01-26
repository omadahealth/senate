class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.boolean :uses_sidekiq
      t.boolean :uses_postgres
      t.boolean :uses_redis
      t.boolean :uses_ldap

      t.timestamps
    end
  end
end
