class SmartMigration41 < ActiveRecord::Migration[8.2]

  def change
    create_table :com_log_sqls, id: :uuid, default: "uuidv7()" do |t|
      t.string :uuid
      t.string :commit_uuid
      t.string :name
      t.boolean :async
      t.string :sql
      t.float :duration
      t.timestamps
    end
  end

end
