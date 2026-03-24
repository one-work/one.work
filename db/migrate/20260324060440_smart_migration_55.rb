class SmartMigration55 < ActiveRecord::Migration[8.2]

  def change

    create_table :solid_queue_job_counter_caches, id: :uuid, default: "uuidv7()" do |t|
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.integer :count
      t.jsonb :values
      t.date :today
      t.string :today_begin_id
      t.integer :version
      t.integer :counter_years_count
      t.integer :counter_months_count
      t.integer :counter_days_count
      t.string :queue_name
      t.timestamps
    end unless table_exists? :solid_queue_job_counter_caches

    add_column :statis_counter_years, :values, :jsonb
    add_column :statis_counter_years, :version, :string
    remove_column :statis_counter_years, :filter, :jsonb

    add_column :statis_counter_months, :values, :jsonb
    add_column :statis_counter_months, :version, :string
    remove_column :statis_counter_months, :filter, :jsonb

    add_column :statis_counter_days, :values, :jsonb
    add_column :statis_counter_days, :version, :string
    remove_column :statis_counter_days, :filter, :jsonb

    create_table :datum_errs, id: :uuid, default: "uuidv7()" do |t|
      t.string :from_type
      t.string :from_id
      t.string :to_class
      t.string :target
      t.timestamps
    end unless table_exists? :datum_errs

    remove_column :ship_box_hosts, :sku, :string

    add_column :ship_areas, :level, :integer

    remove_column :bench_facilitates, :sku, :string

    remove_column :bench_facilitatings, :sku, :string

    add_column :wechat_apps, :oauth_enable, :boolean

    remove_column :finance_funds, :sku, :string

    remove_column :markdown_posts, :ppt, :boolean

    add_column :mqtt_acl, :ip, :string

    add_column :mqtt_user, :ip, :string

    add_column :print_mqtt_printers, :dev_cut_type, :string
    add_column :print_mqtt_printers, :dev_version, :string
    add_column :print_mqtt_printers, :registered_at, :datetime
    add_column :print_mqtt_printers, :authorized_at, :datetime
    add_column :print_mqtt_printers, :ready_at, :datetime

    add_column :print_tasks, :raw, :string, comment: "经过Base64压缩的字节码"
    add_column :print_tasks, :imei, :string
    add_index :print_tasks, :imei
    add_column :print_tasks, :note, :string
    remove_column :print_tasks, :mqtt_printer_id, :uuid
    remove_column :print_tasks, :body, :text

    add_column :factory_product_provides, :ref, :string, comment: "用于数据迁移"

    add_column :factory_provides, :product_provides_count, :integer

    add_column :factory_productions, :spu, :string
    add_index :factory_productions, :spu

    rename_column :factory_products, :sku, :spu

    remove_column :crm_sources, :sku, :string

    add_belongs_to :trade_wallet_frozens, :wallet_advance, type: :uuid

    remove_column :trade_purchases, :sku, :string

    create_table :trade_payment_counter_caches, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.integer :count
      t.jsonb :values
      t.date :today
      t.string :today_begin_id
      t.integer :version
      t.integer :counter_years_count
      t.integer :counter_months_count
      t.integer :counter_days_count
      t.string :state
      t.string :pay_state
      t.timestamps
    end unless table_exists? :trade_payment_counter_caches

    add_column :trade_advances, :enabled, :boolean
    remove_column :trade_advances, :sku, :string

    add_column :trade_wallet_prepayments, :secret, :string

    add_belongs_to :trade_wallet_logs, :operator, type: :uuid
    add_belongs_to :trade_wallet_logs, :wallet_advance, type: :uuid
    add_belongs_to :trade_wallet_logs, :wallet_payment, type: :uuid

    add_column :trade_wallet_goods, :ratio, :decimal
    remove_column :trade_wallet_goods, :good_id, :uuid

    add_column :trade_wallet_advances, :used_amount, :decimal
    add_column :trade_wallet_advances, :remaining_amount, :decimal
    add_column :trade_wallet_advances, :expire_at, :datetime
    add_column :trade_wallet_advances, :total, :decimal
    remove_column :trade_wallet_advances, :operator_id, :uuid

    create_table :trade_order_counter_caches, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.integer :count
      t.jsonb :values
      t.date :today
      t.string :today_begin_id
      t.integer :version
      t.integer :counter_years_count
      t.integer :counter_months_count
      t.integer :counter_days_count
      t.string :state
      t.string :payment_status
      t.timestamps
    end unless table_exists? :trade_order_counter_caches

    create_table :trade_item_counter_caches, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.integer :count
      t.jsonb :values
      t.date :today
      t.string :today_begin_id
      t.integer :version
      t.integer :counter_years_count
      t.integer :counter_months_count
      t.integer :counter_days_count
      t.string :status
      t.timestamps
    end unless table_exists? :trade_item_counter_caches

    add_column :trade_wallet_templates, :hot, :boolean
    add_column :trade_wallet_templates, :limit, :decimal
    add_column :trade_wallet_templates, :prepay_min, :decimal
    add_column :trade_wallet_templates, :prepay_max, :decimal
    add_column :trade_wallet_templates, :expire_min, :datetime
    add_column :trade_wallet_templates, :expire_max, :datetime
    add_column :trade_wallet_templates, :wallet_prepayments_count, :integer
    remove_column :trade_wallet_templates, :appid, :string, comment: "推广微信公众号"

    add_column :trade_wallets, :code, :string
    add_column :trade_wallets, :limit, :decimal, comment: "支付限额"
    add_column :trade_wallets, :adjust_amount, :decimal, comment: "用于矫正计算"
    add_column :trade_wallets, :enabled, :boolean

    add_column :trade_items, :purchase_res, :jsonb

    add_column :org_organs, :auto_purchase, :boolean
  end

end
