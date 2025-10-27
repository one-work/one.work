class SmartMigration37 < ActiveRecord::Migration[8.1]

  def change
    remove_column :com_logs, :user_agent
  end

end
