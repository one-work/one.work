class SmartMigrate5 < ActiveRecord::Migration[8.2]

  def change

    create_table :print_template_table_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template_table, type: :uuid
      t.string :name
      t.string :width
      t.integer :position
      t.timestamps
    end unless table_exists? :print_template_table_items    

    add_column :print_template_items, :type, :string


    create_table :factory_logos, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.timestamps
    end unless table_exists? :factory_logos    

    add_belongs_to :factory_production_provides, :organ, type: :uuid
    add_belongs_to :factory_production_provides, :provider, type: :uuid


    add_belongs_to :factory_product_provides, :organ, type: :uuid
    add_belongs_to :factory_product_provides, :upstream_product, type: :uuid


    add_column :auth_apps, :enabled, :boolean

  end

end
