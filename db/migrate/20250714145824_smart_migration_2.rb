class SmartMigration2 < ActiveRecord::Migration[8.0]

  def change

    add_column :bench_facilitatings, :extra, :jsonb
  end

end
