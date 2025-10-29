class SmartMigration42 < ActiveRecord::Migration[8.2]

  def change
    add_column :com_logs, :accept, :virtual, type: :string, as: "headers#>>'{ACCEPT}'", stored: true
    add_column :com_logs, :referer, :virtual, type: :string, as: "headers#>>'{REFERER}'", stored: true
  end

end
