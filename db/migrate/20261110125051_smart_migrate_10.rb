class SmartMigrate10 < ActiveRecord::Migration[8.2]

  def change

    add_column :org_organs, :desks_count, :integer

  end

end
