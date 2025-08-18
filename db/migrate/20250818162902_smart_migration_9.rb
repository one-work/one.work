class SmartMigration9 < ActiveRecord::Migration[8.0]

  def change
    add_belongs_to :trade_promote_goods, :taxon, type: :uuid
  end

end
