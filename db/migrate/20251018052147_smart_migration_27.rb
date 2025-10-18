class SmartMigration27 < ActiveRecord::Migration[8.1]

  def change
    add_column :mqtt_user, :password, :string
  end

end
