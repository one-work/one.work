class SmartMigration36 < ActiveRecord::Migration[8.1]

  def change

    add_column :com_logs, :session_id, :string
  end

end
