class SmartMigrate6 < ActiveRecord::Migration[8.2]

  def change

    add_column :com_errs, :exception_backtrace, :jsonb


    add_column :ship_areas, :names, :jsonb


    add_column :wechat_apps, :func_infos, :jsonb


    add_column :org_organs, :dispatches, :jsonb



    add_column :eventual_events, :repeat_days, :jsonb

  end

end
