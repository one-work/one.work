class SmartMigrate12 < ActiveRecord::Migration[8.2]

  def change

    add_column :trade_items, :collect_id, :uuid
    add_index :trade_items, :collect_id

  end

end
