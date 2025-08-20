class SmartMigration11 < ActiveRecord::Migration[8.0]

  def change
    add_column :factory_taxons, :countable, :boolean, comment: "可盘点"
    add_column :factory_taxons, :customizable, :boolean, comment: "可定制"
    remove_column :factory_taxons, :take_stock, :boolean, comment: "可盘点"
  end

end
