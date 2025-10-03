class SmartMigration20 < ActiveRecord::Migration[8.1]

  def change
    remove_column :org_organs, :creator_id, :uuid

    rename_column :org_members, :own, :owned

    remove_column :auth_users, :created_organs_count, :integer, limit: 4
  end

end
