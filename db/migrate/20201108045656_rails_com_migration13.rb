class RailsComMigration13 < ActiveRecord::Migration[6.1]

  def change





    remove_column :orders, :maintain_id, :integer, scale: 8






    remove_column :wechat_registers, :record_name, :string, default: "WechatRegister"











































































































    remove_column :task_templates, :pipeline_id, :integer, scale: 4
    remove_column :task_templates, :tasking_type, :string
    rename_column :task_templates, :tasking_id, :project_taxon_id

    remove_column :projects, :record_name, :string, default: "Project"









    remove_column :facilitate_providers, :record_name, :string, default: "FacilitateProvider"








    remove_column :tasks, :tasking_type, :string
    rename_column :tasks, :tasking_id, :project_id




































































  end

end