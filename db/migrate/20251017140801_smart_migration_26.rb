class SmartMigration26 < ActiveRecord::Migration[8.1]

  def change
    add_column :mqtt_user, :password_hash, :string
    remove_column :mqtt_user, :password_digest, :string
  end

end
