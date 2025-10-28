class SmartMigration40 < ActiveRecord::Migration[8.1]

  def change
    add_column :com_logs, :status, :integer
  end

end
