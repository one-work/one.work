class SmartMigration12 < ActiveRecord::Migration[8.0]

  def change
    remove_column :print_devices, :online, :boolean
  end

end
