class SmartMigrate7 < ActiveRecord::Migration[8.2]

  def change

    add_belongs_to :print_tasks, :organ, type: :uuid


    add_column :print_template_items, :unit, :string


    add_column :print_templates, :spec, :string


    create_table :form_examples, id: :uuid, default: "uuidv7()" do |t|
      t.string :text
      t.string :textarea
      t.boolean :checkbox
      t.boolean :radio
      t.timestamps
    end unless table_exists? :form_examples    
  end

end
