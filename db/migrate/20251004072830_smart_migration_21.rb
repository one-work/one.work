class SmartMigration21 < ActiveRecord::Migration[8.1]

  def change
    create_table :factory_barcodes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :unit, type: :uuid
      t.belongs_to :brand, type: :uuid
      t.string :gtin
      t.string :name
      t.string :spec
      t.string :brand_name
      t.string :unit_name
      t.string :supplier
      t.string :made_in
      t.decimal :prince
      t.timestamps
    end
  end

end
