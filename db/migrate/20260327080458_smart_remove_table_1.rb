class SmartRemoveTable1 < ActiveRecord::Migration[8.2]

  def change
    drop_table :bluetooth_devices
    drop_table :bluetooth_errs
    drop_table :com_meta_actions
    drop_table :com_meta_businesses
    drop_table :com_meta_columns
    drop_table :com_meta_controllers
    drop_table :com_meta_models
    drop_table :com_meta_namespaces
    drop_table :com_meta_operations
    drop_table :eventual_event_participants
    drop_table :eventual_plan_items
    drop_table :eventual_plan_participants
    drop_table :print_printers
    drop_table :statis_configs
    drop_table :statis_statistic_days
    drop_table :statis_statistic_months
    drop_table :statis_statistic_years
    drop_table :statis_statistics
    drop_table :stats
    drop_table :com_logs
    drop_table :com_log_sqls
    drop_table :com_log_summaries
    drop_table :requirements
  end

end
