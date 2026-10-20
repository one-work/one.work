class ChangeSomeArrarItems < ActiveRecord::Migration[8.2]
  def change
    remove_column :com_errs, :exception_backtrace
    remove_column :eventual_events, :repeat_days
    remove_column :org_organs, :dispatches
    remove_column :ship_areas, :names
    remove_column :wechat_apps, :func_infos
  end
end
