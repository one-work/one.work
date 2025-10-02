class SmartMigration18 < ActiveRecord::Migration[8.1]

  def change

    add_column :org_organs, :debug_enabled, :boolean
  end

end
