class SmartMigration34 < ActiveRecord::Migration[8.1]

  def change
    add_column :com_logs, :format, :string
  end

end
