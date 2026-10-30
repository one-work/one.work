class SmartMigrate8 < ActiveRecord::Migration[8.2]

  def change

    add_column :com_detectors, :expire_on, :date
    add_column :com_detectors, :note, :string
    add_column :com_detectors, :enabled, :boolean

  end

end
