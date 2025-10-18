class SmartMigration30 < ActiveRecord::Migration[8.1]

  def change
    create_table :print_mqtt_printers, id: :uuid, default: "uuidv7()" do |t|
      t.string :dev_imei
      t.string :dev_type
      t.string :dev_vendor
      t.string :dev_network
      t.string :dev_spec
      t.string :dev_desc
      t.boolean :online
      t.timestamps
    end
  end

end
