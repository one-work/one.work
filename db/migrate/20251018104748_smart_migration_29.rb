class SmartMigration29 < ActiveRecord::Migration[8.1]

  def change
    add_column :mqtt_user, :is_superuser, :boolean
  end

end
