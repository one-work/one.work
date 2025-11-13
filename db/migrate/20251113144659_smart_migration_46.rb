class SmartMigration46 < ActiveRecord::Migration[8.2]

  def change
    create_table :markdown_github_apps, id: :uuid, default: "uuidv7()" do |t|
      t.string :client_id
      t.string :client_secret
      t.timestamps
    end
  end

end
