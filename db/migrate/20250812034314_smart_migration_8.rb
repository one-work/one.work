class SmartMigration8 < ActiveRecord::Migration[8.0]

  def change
    rename_table :print_ip_printers, :print_printers
    remove_column :print_printers, :ip
    remove_column :print_printers, :port

    add_column :print_printers, :uid, :string
  end

end
