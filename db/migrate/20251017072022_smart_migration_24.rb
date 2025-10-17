class SmartMigration24 < ActiveRecord::Migration[8.1]

  def change

    create_table :mqtt_user, id: :uuid, default: "uuidv7()" do |t|
      t.string :username
      t.string :salt
      t.string :password_hash
      t.timestamps
    end
  end

end
