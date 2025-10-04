class SmartMigration22 < ActiveRecord::Migration[8.1]

  def change
    rename_column :factory_barcodes, :prince, :price
  end

end
