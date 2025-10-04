class AddIndexToBarcodes < ActiveRecord::Migration[8.1]
  def change
    add_index :factory_barcodes, :gtin, unique: true
  end
end
