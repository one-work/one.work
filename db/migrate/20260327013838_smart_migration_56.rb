class SmartMigration56 < ActiveRecord::Migration[8.2]

  def change

    add_column :mqtt_user, :note, :string
  end

end
