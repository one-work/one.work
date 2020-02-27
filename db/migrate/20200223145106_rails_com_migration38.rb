class RailsComMigration38 < ActiveRecord::Migration[6.0]

  def change






























































































































    add_reference :shipments, :address
    add_column :shipments, :state, :string

    add_column :packages, :expected_on, :date
    add_column :packages, :pick_mode, :string
    remove_column :packages, :shipment_id, :integer, scale: 8






























































  end

end