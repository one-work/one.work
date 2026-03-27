class SmartRemoveTable1 < ActiveRecord::Migration[8.2]

  def change
    drop_table :bluetooth_devices if table_exists? :bluetooth_devices
    drop_table :bluetooth_errs if table_exists? :bluetooth_errs
    drop_table :com_meta_actions if table_exists? :com_meta_actions
    drop_table :com_meta_businesses if table_exists? :com_meta_businesses
    drop_table :com_meta_columns if table_exists? :com_meta_columns
    drop_table :com_meta_controllers if table_exists? :com_meta_controllers
    drop_table :com_meta_models if table_exists? :com_meta_models
    drop_table :com_meta_namespaces if table_exists? :com_meta_namespaces
    drop_table :com_meta_operations if table_exists? :com_meta_operations
    drop_table :eventual_event_participants if table_exists? :eventual_event_participants
    drop_table :eventual_plan_items if table_exists? :eventual_plan_items
    drop_table :eventual_plan_participants if table_exists? :eventual_plan_participants
    drop_table :print_printers if table_exists? :print_printers
    drop_table :statis_configs if table_exists? :statis_configs
    drop_table :statis_statistic_days if table_exists? :statis_statistic_days
    drop_table :statis_statistic_months if table_exists? :statis_statistic_months
    drop_table :statis_statistic_years if table_exists? :statis_statistic_years
    drop_table :statis_statistics if table_exists? :statis_statistics
    drop_table :stats if table_exists? :states
    drop_table :com_logs if table_exists? :com_logs
    drop_table :com_log_sqls if table_exists? :com_log_sqls
    drop_table :com_log_summaries if table_exists? :com_log_summaries
    drop_table :requirements if table_exists? :requirements
  end

end
