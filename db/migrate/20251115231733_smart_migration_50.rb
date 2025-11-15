class SmartMigration50 < ActiveRecord::Migration[8.2]

  def change
    add_column :print_mqtt_printers, :username, :string
    add_column :print_mqtt_printers, :password, :string
  end

end
