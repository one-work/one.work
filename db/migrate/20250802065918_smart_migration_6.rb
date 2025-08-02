class SmartMigration6 < ActiveRecord::Migration[8.0]

  def change
    remove_column :auth_accounts, :type, :string
  end

end
