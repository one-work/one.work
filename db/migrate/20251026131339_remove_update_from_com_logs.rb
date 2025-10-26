class RemoveUpdateFromComLogs < ActiveRecord::Migration[8.1]
  def change
    remove_column :com_logs, :updated_at
  end
end
