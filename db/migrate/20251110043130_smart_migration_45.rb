class SmartMigration45 < ActiveRecord::Migration[8.2]

  def change
    add_column :print_mqtt_printers, :dev_tel, :string
    add_column :print_mqtt_printers, :dev_cut, :boolean
    add_column :print_mqtt_printers, :dev_ip, :string
    add_column :print_mqtt_printers, :extra, :jsonb
  end

end
