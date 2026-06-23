class RemoveMigrate1 < ActiveRecord::Migration[8.2]

  def change
    drop_table :bench_facilitate_providers if table_exists? :bench_facilitate_providers
    drop_table :bench_standard_providers if table_exists? :bench_standard_providers
    drop_table :bench_standards if table_exists? :bench_standards
    drop_table :doc_maps if table_exists? :doc_maps
    drop_table :doc_subjects if table_exists? :doc_subjects
    drop_table :print_devices if table_exists? :print_devices
    drop_table :print_jia_bo_apps if table_exists? :print_jia_bo_apps
    drop_table :print_jia_bo_printers if table_exists? :print_jia_bo_printers
    drop_table :print_bluetooth_printers if table_exists? :print_bluetooth_printers
    drop_table :print_mqtt_printers if table_exists? :print_mqtt_printers
    drop_table :meta_records if table_exists? :meta_records
    drop_table :meta_operations if table_exists? :meta_operations
    drop_table :meta_namespaces if table_exists? :meta_namespaces
    drop_table :meta_controllers if table_exists? :meta_controllers
    drop_table :meta_columns if table_exists? :meta_columns
    drop_table :meta_businesses if table_exists? :meta_businesses
    drop_table :meta_actions if table_exists? :meta_actions
  end

end
