class SmartMigration31 < ActiveRecord::Migration[8.1]

  def change
    add_column :com_states, :skip_back, :boolean
    add_column :crm_maintains, :vendor, :boolean
  end

end
