class SmartMigration1 < ActiveRecord::Migration[8.2]

  def change

    create_table :requirements, id: :uuid, default: "uuidv7()" do |t|
      t.string :xx
      t.timestamps
    end unless table_exists? :requirements
  end

end
