class SmartMigration10 < ActiveRecord::Migration[8.0]

  def change


    add_belongs_to :trade_promote_goods, :part, type: :uuid
  end

end
