class SmartRemoveTable1 < ActiveRecord::Migration[8.0]

  def change
    drop_table :qingflow_alias_hierarchies
    drop_table :qingflow_aliases
    drop_table :qingflow_applications
    drop_table :qingflow_apps
    drop_table :qingflow_export_items
    drop_table :qingflow_export_users
    drop_table :qingflow_exports
    drop_table :qingflow_files
    drop_table :qingflow_form_hierarchies
    drop_table :qingflow_forms
    drop_table :qingflow_group_forms
    drop_table :qingflow_groups
    drop_table :qingflow_item_statistics
    drop_table :qingflow_item_temps
    drop_table :qingflow_items
    drop_table :qingflow_linkers
    drop_table :qingflow_logs
    drop_table :qingflow_operations
    drop_table :qingflow_pdf_generators
    drop_table :qingflow_tools
    drop_table :qingflow_users
    drop_table :qingflow_versions
  end

end
