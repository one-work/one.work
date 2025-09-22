class SmartMigration16 < ActiveRecord::Migration[8.1]

  def change

    add_column :auth_users, :created_organs_count, :integer
  end

end
