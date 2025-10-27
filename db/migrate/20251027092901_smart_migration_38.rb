class SmartMigration38 < ActiveRecord::Migration[8.1]

  def change

    add_column :com_logs, :user_agent, :virtual, type: :string, as: "headers#>>'{USER_AGENT}'", stored: true
  end

end
