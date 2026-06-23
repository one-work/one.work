class SmartProdMigrate1 < ActiveRecord::Migration[8.2]

  def change

    add_column :doc_subjects, :markdown, :string
    add_column :doc_subjects, :title, :string
    add_column :doc_subjects, :html, :string
    add_column :doc_subjects, :controller_path, :string
    add_column :doc_subjects, :action_name, :string
    add_column :doc_subjects, :request_comments, :jsonb
    add_column :doc_subjects, :response_comments, :jsonb
    add_column :doc_subjects, :synced_at, :datetime
    remove_column :doc_subjects, :rule_id, :uuid


    add_column :doc_maps, :xx, :string

  end

end
