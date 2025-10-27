class SmartMigration35 < ActiveRecord::Migration[8.1]

  def change


    add_column :com_logs, :uuid, :string
    add_column :com_logs, :commit_uuid, :string
  end

end
