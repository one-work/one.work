class SmartMigration4 < ActiveRecord::Migration[8.0]

  def change
    add_column :bench_facilitatings, :name, :string
    add_column :bench_facilitatings, :sku, :string
    add_column :bench_facilitatings, :price, :decimal
    add_column :bench_facilitatings, :advance_price, :decimal
    add_column :bench_facilitatings, :card_price, :jsonb
    add_column :bench_facilitatings, :wallet_price, :jsonb
    add_column :bench_facilitatings, :unit, :string
    add_column :bench_facilitatings, :quantity, :decimal
    add_column :bench_facilitatings, :unified_quantity, :decimal
    add_column :bench_facilitatings, :invest_ratio, :decimal, comment: "抽成比例"
    add_column :bench_facilitatings, :good_type, :string
    add_column :bench_facilitatings, :step, :decimal, comment: "Item Number Step"
  end

end
