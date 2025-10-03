class SmartMigration19 < ActiveRecord::Migration[8.1]

  def change
    add_column :auth_oauth_users, :confirmed, :boolean
    add_column :auth_oauth_users, :source, :string
  end

end
