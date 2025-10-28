class SmartMigration39 < ActiveRecord::Migration[8.1]

  def change
    add_column :com_logs, :duration, :integer
    add_column :com_logs, :view_duration, :float
    add_column :com_logs, :db_duration, :float
    add_column :com_logs, :query_count, :integer
    add_column :com_logs, :query_cached_count, :integer
  end

end
