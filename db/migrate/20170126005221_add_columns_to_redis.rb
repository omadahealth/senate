class AddColumnsToRedis < ActiveRecord::Migration[5.0]
  def change
    add_column :redis, :user, :string
    add_column :redis, :password, :string
    add_column :redis, :host, :string
    add_column :redis, :port, :integer
    add_column :redis, :db, :integer
  end
end
