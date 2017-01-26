class CreateEnvironments < ActiveRecord::Migration[5.0]
  def change
    create_table :environments do |t|
      t.string :name
      t.string :consul_dc

      t.timestamps
    end
  end
end
