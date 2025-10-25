class SmartMigration32 < ActiveRecord::Migration[8.1]

  def change
    add_column :org_organs, :children_count, :integer
  end

end
