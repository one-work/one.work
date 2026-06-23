class SmartMigrate1 < ActiveRecord::Migration[8.2]

  def change

    add_column :roled_role_rules, :identifier, :string
    add_index :roled_role_rules, :identifier
    remove_column :roled_role_rules, :meta_action_id, :uuid


    add_column :roled_caches, :business_hash, :jsonb


    add_column :roled_roles, :business_hash, :jsonb
    add_column :roled_roles, :subdomain, :string
    remove_column :roled_roles, :organ_id, :uuid


    create_table :bench_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.string :name
      t.string :invite_token
      t.integer :facilitate_provides_count
      t.timestamps
    end unless table_exists? :bench_provides    

    add_belongs_to :bench_indicators, :taxon, type: :uuid


    add_belongs_to :bench_facilitators, :organ, type: :uuid


    add_belongs_to :bench_facilitatings, :provide, type: :uuid
    add_column :bench_facilitatings, :estimate_start_at, :datetime
    add_column :bench_facilitatings, :confirmed, :boolean


    create_table :bench_facilitate_resells, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :seller, type: :uuid
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :provide, type: :uuid
      t.string :name
      t.decimal :price
      t.decimal :advance_price
      t.jsonb :card_price
      t.jsonb :wallet_price
      t.jsonb :extra
      t.string :unit
      t.decimal :quantity
      t.decimal :unified_quantity
      t.decimal :invest_ratio, comment: "抽成比例"
      t.string :good_type
      t.decimal :step, comment: "Item Number Step"
      t.string :note
      t.integer :facilitatings_count
      t.timestamps
    end unless table_exists? :bench_facilitate_resells    

    create_table :bench_facilitate_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :provide, type: :uuid
      t.string :note
      t.boolean :default
      t.integer :facilitatings_count
      t.integer :facilitators_count
      t.timestamps
    end unless table_exists? :bench_facilitate_provides    

    add_column :wechat_scenes, :uuid, :string
    add_index :wechat_scenes, :uuid


    remove_column :wechat_menu_root_apps, :menu_root_id, :uuid


    add_column :wechat_menu_apps, :root_position, :integer
    add_column :wechat_menu_apps, :menu_position, :integer
    remove_column :wechat_menu_apps, :menu_id, :uuid
    remove_column :wechat_menu_apps, :menu_root_app_id, :uuid
    remove_column :wechat_menu_apps, :menu_root_id, :uuid


    add_column :wechat_menus, :root_position, :integer
    remove_column :wechat_menus, :menu_root_id, :uuid


    add_belongs_to :finance_expense_items, :taxon, type: :uuid
    remove_column :finance_expense_items, :financial_taxon_id, :uuid


    add_belongs_to :finance_expenses, :taxon, type: :uuid
    remove_column :finance_expenses, :financial_taxon_id, :uuid


    create_table :print_printer_aims, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :printer, type: :uuid
      t.string :aim
      t.timestamps
    end unless table_exists? :print_printer_aims    

    add_belongs_to :print_tasks, :printer, type: :uuid
    remove_column :print_tasks, :device_id, :uuid
    remove_column :print_tasks, :imei, :string


    create_table :print_printers, id: :uuid, default: "uuidv7()" do |t|
      t.boolean :online
      t.string :bluetooth_addr
      t.string :dev_network
      t.string :dev_ip
      t.datetime :registered_at
      t.datetime :authorized_at
      t.datetime :ready_at
      t.datetime :offline_at
      t.datetime :except_at
      t.string :username
      t.string :password
      t.string :type
      t.string :name
      t.string :dev_imei
      t.string :dev_vendor
      t.string :dev_tel
      t.string :dev_spec
      t.boolean :dev_cut
      t.boolean :dev_step
      t.string :dev_desc
      t.string :dev_version
      t.string :dev_type
      t.string :dev_cut_type
      t.jsonb :extra
      t.timestamps
    end unless table_exists? :print_printers    

    add_column :org_organs, :admin, :boolean


    #remove_column :org_members, :wechat_openid, :string


    create_table :auth_user_invites, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :inviter, type: :uuid
      t.string :code
      t.string :scene
      t.timestamps
    end unless table_exists? :auth_user_invites    

    rename_column :auth_users, :invited_code, :invite_code
    add_index :auth_users, :invite_code

    add_column :auth_sessions, :host, :string

  end

end
