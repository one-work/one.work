class SmartMigration3 < ActiveRecord::Migration[8.2]

  def change

    create_table :meta_records do |t|
      t.string :name
      t.string :record_name
      t.string :table_name
      t.string :description
      t.boolean :defined_db
      t.boolean :customizable, comment: "是否允许用户定制"
      t.string :business_identifier
      t.timestamps
    end unless table_exists? :meta_records
    


    create_table :meta_operations do |t|
      t.string :action_name
      t.string :operation
      t.timestamps
    end unless table_exists? :meta_operations
    


    create_table :meta_namespaces do |t|
      t.string :name
      t.string :identifier, null: false
      t.boolean :verify_organ
      t.boolean :verify_member
      t.boolean :verify_user
      t.timestamps
    end unless table_exists? :meta_namespaces
    


    create_table :meta_controllers do |t|
      t.string :namespace_identifier, null: false
      t.string :business_identifier, null: false
      t.string :controller_path, null: false
      t.string :controller_name, null: false
      t.datetime :synced_at
      t.integer :position
      t.timestamps
    end unless table_exists? :meta_controllers
    


    create_table :meta_columns do |t|
      t.string :record_name
      t.string :column_name
      t.string :sql_type
      t.string :column_type
      t.integer :column_limit
      t.string :comment
      t.boolean :defined_db
      t.boolean :defined_model
      t.boolean :belongs_enable
      t.string :belongs_table
      t.timestamps
    end unless table_exists? :meta_columns
    


    create_table :meta_businesses do |t|
      t.string :name
      t.string :identifier, null: false
      t.integer :position
      t.datetime :synced_at
      t.timestamps
    end unless table_exists? :meta_businesses
    


    create_table :meta_actions do |t|
      t.string :namespace_identifier, null: false
      t.string :business_identifier, null: false
      t.string :controller_path, null: false
      t.string :controller_name, null: false
      t.string :action_name, null: false
      t.string :identifier
      t.string :path
      t.string :verb
      t.integer :position
      t.boolean :landmark
      t.datetime :synced_at
      t.boolean :testable
      t.string :request_as
      t.string :required_parts, array: true
      t.string :operation
      t.timestamps
    end unless table_exists? :meta_actions
    

  end

end
