class SmartMigration33 < ActiveRecord::Migration[8.1]

  def change

    create_table :com_logs, id: :uuid, default: "uuidv7()" do |t|
      t.string :path
      t.string :controller_name
      t.string :action_name
      t.jsonb :params
      t.jsonb :headers
      t.jsonb :cookie
      t.jsonb :session
      t.string :ip
      t.string :user_agent
      t.timestamps
    end
  end

end
