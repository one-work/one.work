class SmartMigration7 < ActiveRecord::Migration[8.0]

  def change

    create_table :print_mqtt_apps, id: :uuid, default: "uuidv7()" do |t|
      t.string :key
      t.string :secret
      t.string :base_url
      t.timestamps
    end
  end

end
