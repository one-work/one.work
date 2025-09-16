class SmartMigration14 < ActiveRecord::Migration[8.1]

  def change
    remove_column :org_organs, :factory_settings, :jsonb
  end

end
