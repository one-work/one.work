class SmartMigrate13 < ActiveRecord::Migration[8.2]

  def change

    create_table :roled_menus, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.string :controller_path
      t.string :action_name
      t.string :identifier
      t.string :icon
      t.integer :position
      t.string :namespace
      t.timestamps
    end unless table_exists? :roled_menus    
  end

end
