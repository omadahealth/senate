class AddColumnsToPostgresqls < ActiveRecord::Migration[5.0]
  def change
    add_column :postgresqls, :user, :string
    add_column :postgresqls, :password, :string
    add_column :postgresqls, :host, :string
    add_column :postgresqls, :port, :integer
    add_column :postgresqls, :database, :string
  end
end
