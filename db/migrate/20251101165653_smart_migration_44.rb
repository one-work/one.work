class SmartMigration44 < ActiveRecord::Migration[8.2]

  def change
    add_belongs_to :bench_facilitatings, :organ, type: :uuid
  end

end
