class SmartMigration43 < ActiveRecord::Migration[8.2]

  def change
    add_column :space_desks, :counters, :jsonb, default: {}
  end

end
