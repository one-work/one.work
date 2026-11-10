class SmartMigrate11 < ActiveRecord::Migration[8.2]

  def change

    add_column :org_organs, :start_at, :time
    add_column :org_organs, :finish_at, :time

  end

end
