class SmartMigration13 < ActiveRecord::Migration[8.0]

  def change
    add_column :bluetooth_errs, :err_msg, :string
  end

end
