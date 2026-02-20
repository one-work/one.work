class SmartMigration54 < ActiveRecord::Migration[8.2]

  def change

    create_table :log_request_weeklies, id: :uuid, default: "uuidv7()" do |t|
      t.integer :year
      t.integer :cweek
      t.string :identifier
      t.float :duration_avg
      t.float :duration_max
      t.float :duration_min
      t.integer :total
      t.timestamps
    end unless table_exists? :log_request_weeklies

    create_table :log_requests, id: :uuid, default: "uuidv7()" do |t|
      t.string :uuid
      t.string :path
      t.string :controller_name
      t.string :action_name
      t.jsonb :params
      t.jsonb :headers
      t.jsonb :cookie
      t.jsonb :session
      t.string :ip
      t.string :session_id
      t.string :format
      t.string :commit_uuid
      t.integer :status
      t.integer :duration
      t.float :view_duration
      t.float :db_duration
      t.integer :query_count
      t.integer :query_cached_count
      t.virtual :user_agent, type: :string, as: "headers#>>'{USER_AGENT}'", stored: true
      t.virtual :accept, type: :string, as: "headers#>>'{ACCEPT}'", stored: true
      t.virtual :referer, type: :string, as: "headers#>>'{REFERER}'", stored: true
      t.virtual :identifier, type: :string, as: "controller_name || '#' || action_name", stored: true
      t.timestamps
    end unless table_exists? :log_requests

    create_table :log_query_dailies, id: :uuid, default: "uuidv7()" do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.date :date
      t.string :year_month, index: true
      t.string :identifier
      t.float :duration_avg
      t.float :duration_max
      t.float :duration_min
      t.integer :total
      t.timestamps
    end unless table_exists? :log_query_dailies

    create_table :log_queries, id: :uuid, default: "uuidv7()" do |t|
      t.string :uuid
      t.string :commit_uuid
      t.string :name
      t.boolean :async
      t.string :sql
      t.float :duration
      t.timestamps
    end unless table_exists? :log_queries

    create_table :log_summary_dailies, id: :uuid, default: "uuidv7()" do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.date :date
      t.string :year_month, index: true
      t.float :duration_avg
      t.float :duration_max
      t.float :duration_min
      t.integer :total
      t.timestamps
    end unless table_exists? :log_summary_dailies

    create_table :log_request_dailies, id: :uuid, default: "uuidv7()" do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.date :date
      t.string :year_month, index: true
      t.string :identifier
      t.float :duration_avg
      t.float :duration_max
      t.float :duration_min
      t.integer :total
      t.timestamps
    end unless table_exists? :log_request_dailies

    remove_column :com_state_hierarchies, :id, :uuid, null: false

    remove_column :crm_source_hierarchies, :id, :uuid, null: false

    remove_column :crm_client_hierarchies, :id, :uuid, null: false

    create_table :ship_ips, id: :uuid, default: "uuidv7()" do |t|
      t.string :ip_address, index: true
      t.string :ip_city
      t.decimal :lat
      t.decimal :lng
      t.string :code
      t.timestamps
    end unless table_exists? :ship_ips

    remove_column :ship_area_hierarchies, :id, :uuid, null: false

    remove_column :sync_form_hierarchies, :id, :uuid, null: false

    remove_column :bench_task_template_hierarchies, :id, :uuid, null: false

    remove_column :bench_facilitate_taxon_hierarchies, :id, :uuid, null: false

    remove_column :bench_task_hierarchies, :id, :uuid, null: false

    remove_column :wechat_category_hierarchies, :id, :uuid, null: false

    remove_column :finance_taxon_hierarchies, :id, :uuid, null: false

    create_table :print_template_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template, type: :uuid
      t.string :name
      t.string :code
      t.integer :position
      t.string :kind
      t.timestamps
    end unless table_exists? :print_template_items

    create_table :print_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.timestamps
    end unless table_exists? :print_templates

    if table_exists? :print_tasks
    add_belongs_to :print_tasks, :device, type: :uuid
    add_belongs_to :print_tasks, :mqtt_printer, type: :uuid
    add_belongs_to :print_tasks, :template, type: :uuid
    add_column :print_tasks, :payload, :jsonb
    add_column :print_tasks, :type, :string
    add_column :print_tasks, :uid, :string
    add_column :print_tasks, :print_at, :datetime
    add_column :print_tasks, :body, :text
    end

    remove_column :factory_taxon_hierarchies, :id, :uuid, null: false

    remove_column :factory_serial_hierarchies, :id, :uuid, null: false

    add_column :factory_products, :enable_reorder, :boolean, comment: "在某些场景下（如大批量数据导入），不需要同步"

    add_belongs_to :trade_card_purchases, :card_prepayment, type: :uuid

    add_column :trade_wallet_prepayments, :used_at, :datetime

    add_column :trade_carts, :scope, :string

    create_table :trade_card_prepayments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :card_template, type: :uuid
      t.string :token
      t.integer :days
      t.integer :months
      t.integer :years
      t.datetime :expire_at
      t.datetime :used_at
      t.boolean :activated
      t.timestamps
    end unless table_exists? :trade_card_prepayments

    add_column :trade_items, :scope, :string

    remove_column :org_department_hierarchies, :id, :uuid, null: false

    remove_column :org_organ_hierarchies, :id, :uuid, null: false

    create_table :eventual_event_joins, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :event_crowd, type: :uuid
      t.belongs_to :event, type: :uuid
      t.belongs_to :crowd_member, type: :uuid
      t.belongs_to :participant, polymorphic: true, type: :uuid
      t.integer :score
      t.string :comment
      t.string :quit_note
      t.string :assigned_status
      t.string :job_id
      t.string :state
      t.timestamps
    end unless table_exists? :eventual_event_joins

    create_table :eventual_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :type
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :base_url
      t.boolean :default
      t.timestamps
    end unless table_exists? :eventual_apps

    add_belongs_to :eventual_seats, :hall, type: :uuid
    add_column :eventual_seats, :row, :integer
    add_column :eventual_seats, :col, :integer
    add_column :eventual_seats, :ref_ident, :string

    create_table :eventual_plans, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :planned, polymorphic: true, type: :uuid
      t.belongs_to :time_item, type: :uuid
      t.belongs_to :time_list, type: :uuid
      t.belongs_to :place, type: :uuid
      t.belongs_to :hall, type: :uuid
      t.belongs_to :event, type: :uuid
      t.belongs_to :event_item, type: :uuid
      t.date :plan_on
      t.datetime :plan_at
      t.integer :bookings_count
      t.integer :plan_participants_count
      t.string :repeat_index
      t.jsonb :extra
      t.string :ref_ident, index: true
      t.timestamps
    end unless table_exists? :eventual_plans

    create_table :eventual_halls, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :place, type: :uuid
      t.string :name
      t.integer :rows
      t.integer :cols
      t.integer :min_members
      t.integer :max_members
      t.integer :seats_count
      t.timestamps
    end unless table_exists? :eventual_halls

    add_column :eventual_events, :event_joins_count, :integer
    add_column :eventual_events, :duration_mins, :integer
    add_column :eventual_events, :ref_ident, :string, comment: "外部资源关联 ID"
    remove_column :eventual_events, :event_participants_count, :integer, limit: 4

    create_table :eventual_plan_joins, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :plan, type: :uuid
      t.belongs_to :place, type: :uuid
      t.belongs_to :hall, type: :uuid
      t.belongs_to :event_join, type: :uuid
      t.string :type
      t.string :status, comment: "默认 event_participant 有效"
      t.datetime :plan_at
      t.timestamps
    end unless table_exists? :eventual_plan_joins

    remove_column :eventual_place_taxon_hierarchies, :id, :uuid, null: false

    add_column :eventual_places, :address, :string
    add_column :eventual_places, :tel, :string
    add_column :eventual_places, :halls_count, :integer
    add_column :eventual_places, :ref_ident, :string

    remove_column :detail_knowledge_hierarchies, :id, :uuid, null: false
  end

end
