class SmartMigration28 < ActiveRecord::Migration[8.1]

  def change
    create_table :mqtt_acl, id: :uuid, default: "uuidv7()" do |t|
      t.string :username
      t.string :permission
      t.string :action
      t.string :topic
      t.timestamps
    end
  end

end
