class SmartMigration23 < ActiveRecord::Migration[8.1]

  def change
    add_column :org_organs, :dispatches, :string, array: true, default: []
  end

end
