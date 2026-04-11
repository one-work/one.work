class SmartMigration2 < ActiveRecord::Migration[8.2]

  def change

    add_belongs_to :ship_packageds, :item, type: :uuid
    add_belongs_to :ship_packageds, :good, polymorphic: true, type: :uuid
    add_column :ship_packageds, :item_status, :string
    remove_column :ship_packageds, :good_item_id, :uuid
    remove_column :ship_packageds, :good_item_type, :string
    remove_column :ship_packageds, :trade_item_id, :uuid
    remove_column :ship_packageds, :trade_item_status, :string


    add_column :ship_packages, :tracking_number, :string


    add_column :print_mqtt_printers, :offline_at, :datetime


    add_column :ship_addresses, :pending_count, :integer, comment: "待发货"


    add_belongs_to :trade_payment_orders, :wallet, type: :uuid
    add_column :trade_payment_orders, :batch_no, :string


    create_table :eventual_place_plans do |t|
      t.belongs_to :place, type: :uuid
      t.belongs_to :event, type: :uuid
      t.date :plan_on
      t.integer :plans_count
      t.timestamps
    end unless table_exists? :eventual_place_plans
    


    add_column :eventual_seats, :area, :string


    add_column :eventual_plans, :price_min, :decimal
    add_column :eventual_plans, :price_max, :decimal
    add_column :eventual_plans, :synced_at, :datetime
    add_column :eventual_plans, :seats, :jsonb


    add_column :eventual_apps, :agentid, :string
    add_column :eventual_apps, :missed_event, :boolean
    add_column :eventual_apps, :extra, :jsonb


    add_column :eventual_events, :extra, :jsonb
    add_column :eventual_events, :synced_at, :datetime


    add_column :eventual_plan_joins, :name, :string
    add_column :eventual_plan_joins, :price, :decimal
    add_column :eventual_plan_joins, :advance_price, :decimal
    add_column :eventual_plan_joins, :card_price, :jsonb
    add_column :eventual_plan_joins, :wallet_price, :jsonb
    add_column :eventual_plan_joins, :extra, :jsonb
    add_column :eventual_plan_joins, :unit, :string
    add_column :eventual_plan_joins, :quantity, :decimal
    add_column :eventual_plan_joins, :unified_quantity, :decimal
    add_column :eventual_plan_joins, :invest_ratio, :decimal, comment: "抽成比例"
    add_column :eventual_plan_joins, :good_type, :string
    add_column :eventual_plan_joins, :step, :decimal, comment: "Item Number Step"
    add_column :eventual_plan_joins, :seat_no, :string
    add_column :eventual_plan_joins, :res, :jsonb

  end

end
