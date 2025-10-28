class RemoveUpdateFromComSqls < ActiveRecord::Migration[8.2]
  def change
    remove_column :com_log_sqls, :updated_at
  end
end
