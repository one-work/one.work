class SmartMigration25 < ActiveRecord::Migration[8.1]

  def change

    add_column :mqtt_user, :password_digest, :string
    remove_column :mqtt_user, :salt, :string
    remove_column :mqtt_user, :password_hash, :string
  end

end
