class SmartMigration1 < ActiveRecord::Migration[8.0]

  def change

    create_table :action_text_rich_texts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :record, polymorphic: true, type: :uuid
      t.text :body
      t.string :name, null: false
      t.timestamps
      t.index [:record_type, :record_id, :name], unique: true, name: "index_action_text_rich_texts_uniqueness"
    end

    create_table :action_mailbox_inbound_emails, id: :uuid, default: "uuidv7()" do |t|
      t.integer :status, null: false
      t.string :message_id, null: false
      t.string :message_checksum, null: false
      t.timestamps
      t.index [:message_id, :message_checksum], unique: true, name: "index_action_mailbox_inbound_emails_uniqueness"
    end

    create_table :active_storage_attachments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :record, polymorphic: true, type: :uuid
      t.belongs_to :blob, type: :uuid
      t.string :name, null: false
      t.timestamps
    end

    create_table :active_storage_variant_records, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :blob, type: :uuid
      t.string :variation_digest, null: false
      t.timestamps
    end

    create_table :active_storage_blobs, id: :uuid, default: "uuidv7()" do |t|
      t.jsonb :metadata
      t.string :key, null: false, index: {unique: true}
      t.string :filename, null: false
      t.string :content_type
      t.integer :byte_size, null: false
      t.string :checksum
      t.string :service_name, null: false
      t.datetime :created_at, null: false
    end

    create_table :statis_configs, id: :uuid, default: "uuidv7()" do |t|
      t.string :statistical_type
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.jsonb :scopes
      t.jsonb :keys
      t.jsonb :sums
      t.date :today
      t.integer :today_begin_id
      t.integer :counter_years_count
      t.integer :counter_months_count
      t.integer :counter_days_count
      t.timestamps
    end

    create_table :debug_throughs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :many, type: :uuid
      t.belongs_to :much, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :debug_ones, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :state
      t.timestamps
    end

    create_table :debug_muches, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.timestamps
    end

    create_table :debug_manies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :one, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :statis_statistic_years, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :statistic, type: :uuid
      t.integer :year
      t.decimal :value
      t.timestamps
    end

    create_table :statis_statistic_months, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :statistic, type: :uuid
      t.integer :year
      t.integer :month
      t.string :year_month, index: true
      t.decimal :value
      t.timestamps
    end

    create_table :statis_statistic_days, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :statistic, type: :uuid
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :year_month, index: true
      t.date :date
      t.decimal :value
      t.timestamps
    end

    create_table :statis_statistics, id: :uuid, default: "uuidv7()" do |t|
      t.string :statistical_type
      t.string :column
      t.jsonb :extra
      t.string :value
      t.boolean :cached
      t.integer :statistic_years_count
      t.integer :statistic_months_count
      t.integer :statistic_days_count
      t.timestamps
    end

    create_table :roled_tabs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.string :name
      t.string :path
      t.string :icon
      t.integer :position
      t.string :namespace
      t.timestamps
    end

    create_table :roled_role_whos, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.belongs_to :who, polymorphic: true, type: :uuid
      t.timestamps
    end

    create_table :roled_role_types, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.string :who_type
      t.timestamps
    end

    create_table :roled_role_rules, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.belongs_to :meta_action, type: :uuid
      t.string :business_identifier
      t.string :namespace_identifier
      t.string :controller_path
      t.string :action_name
      t.string :params_name
      t.string :params_identifier
      t.timestamps
    end

    create_table :roled_cache_roles, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :role, type: :uuid
      t.belongs_to :cache, type: :uuid
      t.timestamps
    end

    create_table :roled_caches, id: :uuid, default: "uuidv7()" do |t|
      t.string :str_role_ids, index: true
      t.jsonb :role_hash
      t.timestamps
    end

    create_table :roled_roles, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :tip
      t.string :description
      t.boolean :visible
      t.jsonb :role_hash
      t.boolean :default
      t.timestamps
    end

    create_table :statis_counter_years, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :config, type: :uuid
      t.integer :year
      t.date :begin_on
      t.integer :count
      t.jsonb :filter
      t.timestamps
    end

    create_table :statis_counter_months, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :config, type: :uuid
      t.integer :year
      t.integer :month
      t.string :year_month, index: true
      t.integer :count
      t.jsonb :filter
      t.timestamps
    end

    create_table :statis_counter_days, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :config, type: :uuid
      t.integer :year
      t.integer :month
      t.integer :day
      t.string :year_month, index: true
      t.date :date
      t.integer :count
      t.jsonb :filter
      t.timestamps
    end

    create_table :com_meta_operations, id: :uuid, default: "uuidv7()" do |t|
      t.string :action_name
      t.string :operation
      t.timestamps
    end

    create_table :com_meta_namespaces, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :identifier, null: false, index: true
      t.boolean :verify_organ
      t.boolean :verify_member
      t.boolean :verify_user
      t.timestamps
    end

    create_table :com_infos, id: :uuid, default: "uuidv7()" do |t|
      t.string :code
      t.string :value
      t.string :version
      t.string :platform
      t.timestamps
    end

    create_table :com_filter_columns, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :filter, type: :uuid
      t.string :column
      t.string :value
      t.timestamps
    end

    create_table :com_filters, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :controller_path, null: false
      t.string :action_name
      t.string :name
      t.timestamps
      t.index [:controller_path, :action_name]
    end

    create_table :com_err_summaries, id: :uuid, default: "uuidv7()" do |t|
      t.string :controller_name
      t.string :action_name
      t.string :exception_object
      t.integer :errs_count
      t.timestamps
    end

    create_table :com_detectors, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :url
      t.timestamps
    end

    create_table :com_csps, id: :uuid, default: "uuidv7()" do |t|
      t.string :document_uri
      t.string :referrer
      t.string :violated_directive
      t.string :effective_directive
      t.string :original_policy
      t.string :disposition
      t.string :blocked_uri
      t.string :line_number
      t.string :column_number
      t.string :source_file
      t.string :status_code
      t.string :script_sample
      t.timestamps
    end

    create_table :com_cache_lists, id: :uuid, default: "uuidv7()" do |t|
      t.string :path
      t.string :key
      t.timestamps
    end

    create_table :com_blob_pdfs, id: :uuid, default: "uuidv7()" do |t|
      t.string :url
      t.timestamps
    end

    create_table :com_blob_defaults, id: :uuid, default: "uuidv7()" do |t|
      t.string :record_class, comment: "AR 类名，如 User"
      t.string :name, comment: "名称, attach 名称，如：avatar"
      t.string :macro
      t.timestamps
    end

    create_table :com_acme_domains, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :acme_servicer, type: :uuid
      t.string :domain
      t.timestamps
    end

    create_table :com_acme_accounts, id: :uuid, default: "uuidv7()" do |t|
      t.string :email
      t.string :kid
      t.timestamps
    end

    create_table :com_state_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "com/state_anc_desc_idx"
    end

    create_table :com_states, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.uuid :parent_id
      t.string :host
      t.string :path
      t.string :controller_path
      t.string :action_name
      t.string :request_method
      t.string :referer
      t.jsonb :params
      t.jsonb :body
      t.jsonb :cookie
      t.string :session_id
      t.jsonb :session
      t.boolean :destroyable
      t.string :auth_token
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :com_ssh_keys, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.string :host
      t.string :ssh_user
      t.string :private_key
      t.string :public_key
      t.string :fingerprint
      t.jsonb :extra
      t.timestamps
    end

    create_table :com_meta_models, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :record_name, index: true
      t.string :table_name
      t.string :description
      t.boolean :defined_db
      t.boolean :customizable, comment: "是否允许用户定制"
      t.string :business_identifier, null: false, index: true
      t.timestamps
    end

    create_table :com_meta_controllers, id: :uuid, default: "uuidv7()" do |t|
      t.string :namespace_identifier, null: false, index: true
      t.string :business_identifier, null: false, index: true
      t.string :controller_path, null: false, index: true
      t.string :controller_name, null: false
      t.datetime :synced_at
      t.integer :position
      t.timestamps
    end

    create_table :com_meta_columns, id: :uuid, default: "uuidv7()" do |t|
      t.string :record_name, index: true
      t.string :column_name
      t.string :sql_type
      t.string :column_type
      t.integer :column_limit
      t.string :comment
      t.boolean :defined_db
      t.boolean :defined_model
      t.boolean :belongs_enable
      t.string :belongs_table
      t.timestamps
    end

    create_table :com_meta_businesses, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :identifier, null: false, index: true
      t.integer :position
      t.datetime :synced_at
      t.timestamps
    end

    create_table :com_meta_actions, id: :uuid, default: "uuidv7()" do |t|
      t.string :namespace_identifier, null: false, index: true
      t.string :business_identifier, null: false, index: true
      t.string :controller_path, null: false, index: true
      t.string :controller_name, null: false
      t.string :action_name
      t.string :path
      t.string :verb
      t.integer :position
      t.boolean :landmark
      t.datetime :synced_at
      t.string :required_parts, array: true
      t.string :operation
      t.timestamps
    end

    create_table :com_err_notices, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :err_bot, type: :uuid
      t.string :controller_name, index: true
      t.timestamps
    end

    create_table :com_errs, id: :uuid, default: "uuidv7()" do |t|
      t.string :path
      t.string :controller_name
      t.string :action_name
      t.string :exception
      t.string :exception_object
      t.string :exception_backtrace, array: true
      t.jsonb :params
      t.jsonb :headers
      t.jsonb :cookie
      t.jsonb :session
      t.string :ip
      t.timestamps
    end

    create_table :com_blob_temps, id: :uuid, default: "uuidv7()" do |t|
      t.string :note
      t.timestamps
    end

    create_table :com_acme_orders, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :acme_account, type: :uuid
      t.string :orderid
      t.string :url
      t.datetime :issued_at
      t.datetime :expire_at, comment: "过期时间"
      t.string :identifiers, array: true
      t.string :sync_host
      t.string :sync_path
      t.string :status
      t.timestamps
    end

    create_table :com_err_bots, id: :uuid, default: "uuidv7()" do |t|
      t.string :base_url
      t.string :type
      t.string :hook_key
      t.string :hook_url
      t.boolean :first_time
      t.string :secret
      t.timestamps
    end

    create_table :com_detector_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :detector, type: :uuid
      t.string :error
      t.string :type
      t.string :status
      t.string :body
      t.datetime :started_at
      t.integer :spend, comment: "单位为毫秒"
      t.timestamps
    end

    create_table :com_detector_bots, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :detector, type: :uuid
      t.string :type
      t.string :hook_url
      t.timestamps
    end

    create_table :com_acme_identifiers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :acme_order, type: :uuid
      t.string :type
      t.string :identifier
      t.string :file_name
      t.string :file_content
      t.string :token
      t.string :record_name
      t.string :record_content
      t.string :domain
      t.string :domain_root
      t.boolean :wildcard
      t.string :url
      t.string :status
      t.timestamps
    end

    create_table :com_acme_servicers, id: :uuid, default: "uuidv7()" do |t|
      t.string :type
      t.string :key
      t.string :secret
      t.timestamps
    end

    create_table :cms_videos, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :author, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :video_taxon, type: :uuid
      t.string :title
      t.integer :share_count
      t.integer :view_count
      t.integer :liked_count
      t.integer :comments_count
      t.string :water_mark_job
      t.string :state
      t.timestamps
    end

    create_table :cms_tags, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.timestamps
    end

    create_table :cms_progressions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :progressive, polymorphic: true, type: :uuid
      t.decimal :ratio, comment: "完成比例"
      t.decimal :time
      t.decimal :duration
      t.string :state
      t.timestamps
    end

    create_table :cms_covers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.timestamps
    end

    create_table :cms_audio_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :audio, type: :uuid
      t.belongs_to :tag, type: :uuid
      t.timestamps
    end

    create_table :cms_audios, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :author, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.string :state
      t.timestamps
    end

    create_table :cms_carousels, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.integer :position
      t.string :link
      t.boolean :enabled
      t.timestamps
    end

    create_table :doc_subjects, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :rule, type: :uuid
      t.string :name
      t.jsonb :path_params
      t.jsonb :request_params
      t.jsonb :request_headers
      t.string :request_type
      t.jsonb :request_body
      t.string :response_status
      t.jsonb :response_headers
      t.string :response_type
      t.string :response_body
      t.string :note
      t.timestamps
    end

    create_table :doc_maps, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.jsonb :mappings
      t.timestamps
    end

    create_table :datum_validations, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template, type: :uuid
      t.string :sheet
      t.string :header
      t.jsonb :fields
      t.timestamps
    end

    create_table :datum_template_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template, type: :uuid
      t.jsonb :fields
      t.integer :position
      t.timestamps
    end

    create_table :datum_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :code
      t.jsonb :headers
      t.integer :header_line
      t.integer :template_items_count
      t.datetime :uploaded_at
      t.jsonb :parameters
      t.timestamps
    end

    create_table :datum_table_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :table_list, type: :uuid
      t.jsonb :fields
      t.timestamps
    end

    create_table :datum_record_lists, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :data_list, type: :uuid
      t.jsonb :columns
      t.jsonb :parameters
      t.boolean :done
      t.timestamps
    end

    create_table :datum_export_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :export, type: :uuid
      t.jsonb :fields
      t.integer :position
      t.jsonb :extra
      t.timestamps
    end

    create_table :datum_exports, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template, type: :uuid
      t.string :name
      t.string :code
      t.jsonb :formats
      t.jsonb :editable
      t.timestamps
    end

    create_table :datum_table_lists, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :data_list, type: :uuid
      t.jsonb :parameters
      t.jsonb :headers
      t.jsonb :footers
      t.integer :table_items_count
      t.string :timestamp
      t.boolean :done
      t.boolean :published
      t.jsonb :extra
      t.timestamps
    end

    create_table :datum_data_lists, id: :uuid, default: "uuidv7()" do |t|
      t.string :title
      t.string :comment
      t.string :type
      t.jsonb :columns
      t.integer :x_position
      t.string :data_table
      t.string :export_excel
      t.string :export_pdf
      t.jsonb :parameters
      t.timestamps
    end

    create_table :ship_ways, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :line, type: :uuid
      t.string :name
      t.string :start_name
      t.string :finish_name
      t.integer :locations_count
      t.timestamps
    end

    create_table :space_stations, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :area, type: :uuid
      t.string :name
      t.string :code
      t.string :detail
      t.integer :buildings_count
      t.integer :rooms_count
      t.jsonb :area_ancestors
      t.string :poiname
      t.string :poiaddress
      t.string :cityname
      t.decimal :lat
      t.decimal :lng
      t.point :coordinate
      t.timestamps
    end

    create_table :ship_shipment_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :shipment, type: :uuid
      t.belongs_to :station, type: :uuid
      t.datetime :expected_leave_at
      t.datetime :left_at
      t.datetime :arrived_at
      t.datetime :prepared_at
      t.timestamps
    end

    create_table :ship_shipment_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :loaded_station, type: :uuid
      t.belongs_to :unloaded_station, type: :uuid
      t.belongs_to :shipment, type: :uuid
      t.belongs_to :package, type: :uuid
      t.belongs_to :station, type: :uuid
      t.belongs_to :box, type: :uuid
      t.datetime :loaded_at
      t.datetime :unloaded_at
      t.string :confirm_mode
      t.string :state
      t.string :status
      t.timestamps
    end

    create_table :ship_shipments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :line, type: :uuid
      t.belongs_to :car, type: :uuid
      t.belongs_to :driver, type: :uuid
      t.belongs_to :current_line_station, type: :uuid
      t.belongs_to :shipping, polymorphic: true, type: :uuid
      t.string :type
      t.datetime :expected_leave_at
      t.datetime :expected_arrive_at
      t.datetime :left_at
      t.datetime :arrived_at
      t.date :load_on
      t.integer :shipment_items_count
      t.integer :expected_minutes, comment: "预计路途分钟数"
      t.string :state
      t.timestamps
    end

    create_table :ship_packageds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :trade_item, type: :uuid
      t.belongs_to :good_item, polymorphic: true, type: :uuid
      t.belongs_to :package, type: :uuid
      t.string :trade_item_status
      t.timestamps
    end

    create_table :ship_packages, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :produce_plan, type: :uuid
      t.belongs_to :from_station, type: :uuid
      t.belongs_to :from_address, type: :uuid
      t.belongs_to :station, type: :uuid
      t.belongs_to :address, type: :uuid
      t.belongs_to :box, type: :uuid
      t.belongs_to :current_shipment, type: :uuid
      t.string :state
      t.date :expected_on
      t.string :pick_mode
      t.string :confirm_mode
      t.datetime :boxed_in_at
      t.datetime :boxed_out_at
      t.integer :packageds_count
      t.integer :shipment_items_count
      t.timestamps
    end

    create_table :ship_locations, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :area, type: :uuid
      t.belongs_to :way, type: :uuid
      t.belongs_to :station, type: :uuid
      t.string :name
      t.integer :position
      t.string :poiname
      t.string :poiaddress
      t.string :cityname
      t.decimal :lat
      t.decimal :lng
      t.point :coordinate
      t.jsonb :area_ancestors
      t.timestamps
    end

    create_table :ship_line_stations, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :line, type: :uuid
      t.belongs_to :station, type: :uuid
      t.integer :position
      t.integer :expected_minutes, comment: "预计到下站分钟数"
      t.timestamps
    end

    create_table :ship_line_similars, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :line, type: :uuid
      t.belongs_to :similar, type: :uuid
      t.decimal :score
      t.integer :position
      t.timestamps
    end

    create_table :ship_lines, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :start_name
      t.string :finish_name
      t.integer :line_stations_count
      t.timestamps
    end

    create_table :ship_favorites, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :driver, type: :uuid
      t.string :remark
      t.timestamps
    end

    create_table :ship_drivers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.string :name
      t.string :number
      t.jsonb :detail
      t.timestamps
    end

    create_table :ship_car_drivers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :car, type: :uuid
      t.belongs_to :driver, type: :uuid
      t.jsonb :repeat_days
      t.string :event_type
      t.timestamps
    end

    create_table :ship_cars, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.string :brand, comment: "车品牌"
      t.string :location
      t.string :number, comment: "车牌号"
      t.string :tel, comment: "随车电话"
      t.jsonb :detail
      t.string :carriage
      t.string :kind
      t.timestamps
    end

    create_table :ship_box_specifications, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.integer :width
      t.integer :length
      t.integer :height
      t.integer :boxes_count
      t.string :unit
      t.string :code
      t.timestamps
    end

    create_table :ship_box_sells, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :box_specification, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.decimal :price
      t.integer :amount
      t.integer :done_amount
      t.integer :rest_amount
      t.string :state
      t.timestamps
    end

    create_table :ship_box_proxy_sells, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :box_specification, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.integer :sellable_count
      t.decimal :price
      t.timestamps
    end

    create_table :ship_box_proxy_buys, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :box_specification, type: :uuid
      t.belongs_to :box_host, type: :uuid
      t.integer :buyable_count
      t.decimal :price
      t.timestamps
    end

    create_table :ship_box_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :box, type: :uuid
      t.belongs_to :boxed, polymorphic: true, type: :uuid
      t.datetime :boxed_in_at
      t.datetime :boxed_out_at
      t.integer :duration
      t.string :confirm_mode
      t.timestamps
    end

    create_table :ship_box_hosts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :box_specification, type: :uuid
      t.integer :boxes_count
      t.integer :tradable_count, comment: "可交易数量，可租亦可卖"
      t.virtual :traded_count, type: :integer, as: "boxes_count - tradable_count", stored: true
      t.integer :rent_charges_count
      t.string :rent_unit
      t.string :name
      t.string :sku
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
      t.timestamps
    end

    create_table :ship_box_holds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :box_specification, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.integer :boxes_count
      t.integer :rented_amount
      t.integer :owned_amount
      t.integer :box_host_id
      t.timestamps
    end

    create_table :ship_boxes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :box_specification, type: :uuid
      t.string :code
      t.integer :shipment_items_count
      t.integer :box_logs_count
      t.string :status
      t.string :state
      t.timestamps
    end

    create_table :ship_address_uses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :address, type: :uuid
      t.string :kind
      t.timestamps
    end

    create_table :ship_area_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "ship/area_anc_desc_idx"
    end

    create_table :ship_areas, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.string :name
      t.string :full
      t.boolean :published
      t.boolean :popular
      t.string :names, array: true
      t.string :timezone
      t.string :locale
      t.string :code
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :ship_addresses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :area, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :station, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.string :name
      t.string :detail
      t.string :contact_person
      t.string :tel
      t.string :post_code
      t.string :source
      t.string :cached_key
      t.boolean :principal
      t.jsonb :area_ancestors
      t.string :floor, comment: "楼层"
      t.string :room, comment: "房间号"
      t.timestamps
    end

    create_table :sync_records, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :app, type: :uuid
      t.string :name
      t.string :key
      t.timestamps
    end

    create_table :sync_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :item, type: :uuid
      t.belongs_to :related, polymorphic: true, type: :uuid
      t.string :exception
      t.jsonb :exception_backtrace
      t.timestamps
    end

    create_table :sync_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :record, type: :uuid
      t.string :identifier, index: true
      t.jsonb :values
      t.integer :logs_count
      t.string :source
      t.timestamps
    end

    create_table :sync_form_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "sync/form_anc_desc_idx"
    end

    create_table :sync_forms, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :record, type: :uuid
      t.belongs_to :meta_column, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.string :column_name
      t.string :record_name
      t.string :external_column_name
      t.string :external_record_name
      t.boolean :display
      t.boolean :primary
      t.boolean :modeling
      t.timestamps
    end

    create_table :sync_audits, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :synchro, polymorphic: true, type: :uuid
      t.belongs_to :operator, polymorphic: true, type: :uuid
      t.belongs_to :destined, type: :uuid
      t.jsonb :synchro_params
      t.jsonb :audited_changes
      t.string :operation
      t.string :note
      t.string :state
      t.datetime :apply_at
      t.timestamps
    end

    create_table :sync_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :type
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.string :base_url
      t.timestamps
    end

    create_table :auditor_verifiers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.belongs_to :verifiable, polymorphic: true, type: :uuid
      t.string :name
      t.integer :position
      t.timestamps
    end

    create_table :auditor_verifications, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.belongs_to :verified, polymorphic: true, type: :uuid
      t.belongs_to :verifier, type: :uuid
      t.string :state
      t.string :note
      t.integer :position
      t.boolean :confirmed
      t.timestamps
    end

    create_table :auditor_approvals, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :approving, polymorphic: true, type: :uuid
      t.belongs_to :operator, polymorphic: true, type: :uuid
      t.boolean :approved
      t.jsonb :pending_changes
      t.jsonb :related_changes
      t.string :comment
      t.datetime :approved_at
      t.integer :unapproved_approvals_count
      t.string :state
      t.timestamps
    end

    create_table :auditor_audits, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :audited, polymorphic: true, type: :uuid
      t.belongs_to :operator, polymorphic: true, type: :uuid
      t.string :type
      t.string :action
      t.jsonb :audited_changes
      t.jsonb :related_changes
      t.jsonb :extra
      t.string :note
      t.string :remote_ip
      t.string :controller_path
      t.string :action_name
      t.datetime :created_at, null: false, index: true
    end

    create_table :bench_taxon_indicators, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :indicator, type: :uuid
      t.integer :weight
      t.timestamps
    end

    create_table :bench_taxon_facilitates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :facilitate, type: :uuid
      t.timestamps
    end

    create_table :bench_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.string :record_name
      t.string :name
      t.integer :projects_count
      t.jsonb :parameters
      t.decimal :fund_budget
      t.decimal :fund_expense
      t.decimal :budget_amount
      t.decimal :expense_amount
      t.timestamps
    end

    create_table :bench_task_timers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :task, type: :uuid
      t.integer :duration
      t.datetime :finish_at
      t.timestamps
    end

    create_table :bench_task_template_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "bench/task_template_anc_desc_idx"
    end

    create_table :bench_task_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.belongs_to :member, type: :uuid
      t.jsonb :parent_ancestors
      t.string :title
      t.integer :position
      t.string :color
      t.string :repeat_type
      t.jsonb :repeat_days
      t.timestamps
    end

    create_table :bench_standard_providers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :facilitate, type: :uuid
      t.boolean :selected
      t.string :note
      t.decimal :export_price
      t.timestamps
    end

    create_table :bench_standards, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.timestamps
    end

    create_table :bench_project_webhooks, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :project, type: :uuid
      t.jsonb :origin_data
      t.jsonb :valuable_data
      t.timestamps
    end

    create_table :bench_project_stages, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.date :begin_on
      t.date :end_on
      t.string :note
      t.integer :projects_count
      t.decimal :fund_budget
      t.decimal :fund_expense
      t.decimal :budget_amount
      t.decimal :expense_amount
      t.timestamps
    end

    create_table :bench_project_mileposts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :project, type: :uuid
      t.belongs_to :milepost, type: :uuid
      t.date :recorded_on
      t.boolean :current
      t.string :milepost_name
      t.timestamps
    end

    create_table :bench_project_indicators, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :project, type: :uuid
      t.belongs_to :indicator, type: :uuid
      t.date :recorded_on
      t.datetime :recorded_at
      t.string :value
      t.string :source
      t.string :comment
      t.string :state
      t.timestamps
    end

    create_table :bench_project_facilitates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :project, type: :uuid
      t.belongs_to :facilitate_taxon, type: :uuid
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.timestamps
    end

    create_table :bench_mileposts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.integer :position
      t.integer :project_mileposts_count
      t.timestamps
    end

    create_table :bench_facilitators, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :member, type: :uuid
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :bench_facilitatings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :facilitator, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :wallet_payment, type: :uuid
      t.belongs_to :item, type: :uuid
      t.datetime :start_at
      t.datetime :finish_at
      t.datetime :estimate_finish_at
      t.timestamps
    end

    create_table :bench_facilitate_taxon_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "bench/facilitate_taxon_anc_desc_idx"
    end

    create_table :bench_facilitate_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.string :color
      t.string :description
      t.integer :position
      t.integer :facilitates_count
      t.integer :indicators_count
      t.timestamps
    end

    create_table :bench_facilitate_providers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.string :note
      t.boolean :selected
      t.timestamps
    end

    create_table :bench_facilitate_indicators, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :facilitate, type: :uuid
      t.belongs_to :facilitate_taxon, type: :uuid
      t.belongs_to :indicator, type: :uuid
      t.string :note
      t.timestamps
    end

    create_table :bench_facilitates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :standard, type: :uuid
      t.belongs_to :facilitate_taxon, type: :uuid
      t.string :name
      t.decimal :quantity
      t.decimal :unified_quantity
      t.string :unit
      t.string :description
      t.string :qr_prefix
      t.boolean :published
      t.string :sku
      t.decimal :price
      t.decimal :advance_price
      t.jsonb :card_price
      t.jsonb :wallet_price
      t.jsonb :extra
      t.decimal :invest_ratio, comment: "抽成比例"
      t.string :good_type
      t.decimal :step, comment: "Item Number Step"
      t.timestamps
    end

    create_table :finance_budgets, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :financial, polymorphic: true, type: :uuid
      t.belongs_to :fund, type: :uuid
      t.belongs_to :stock, type: :uuid
      t.belongs_to :financial_taxon, type: :uuid
      t.belongs_to :task, type: :uuid
      t.decimal :amount
      t.string :type
      t.string :subject
      t.string :note
      t.string :state
      t.timestamps
    end

    create_table :bench_task_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "bench/task_anc_desc_idx"
    end

    create_table :bench_tasks, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :project, type: :uuid
      t.belongs_to :task_template, type: :uuid
      t.belongs_to :parent, type: :uuid
      t.string :title
      t.integer :position
      t.string :note
      t.integer :estimated_time
      t.integer :actual_time
      t.datetime :done_at
      t.integer :children_count
      t.datetime :start_at
      t.string :serial_number, comment: "Task Template test repeat"
      t.decimal :cost_fund
      t.integer :cost_stock
      t.date :deadline_on
      t.string :state
      t.string :focus
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :bench_projects, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.string :name
      t.string :description
      t.string :state
      t.jsonb :extra
      t.decimal :fund_budget
      t.decimal :fund_expense
      t.decimal :budget_amount
      t.decimal :expense_amount
      t.timestamps
    end

    create_table :bench_indicators, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :description
      t.string :unit
      t.decimal :reference_min
      t.decimal :reference_max
      t.string :target_source
      t.timestamps
    end

    create_table :email_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :contact
      t.string :subject
      t.string :honorific
      t.string :body
      t.string :order_prefix
      t.integer :position, index: true
      t.timestamps
    end

    create_table :email_subscriptions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :smtp, type: :uuid
      t.belongs_to :smtp_account, type: :uuid
      t.belongs_to :reason, type: :uuid
      t.string :address
      t.datetime :subscribe_at
      t.datetime :unsubscribe_at
      t.string :state
      t.timestamps
    end

    create_table :email_smtp_accounts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :smtp, type: :uuid
      t.string :user_name
      t.string :password
      t.integer :position, index: true
      t.timestamps
    end

    create_table :email_smtps, id: :uuid, default: "uuidv7()" do |t|
      t.string :address
      t.string :port
      t.boolean :enable_starttls_auto
      t.boolean :ssl
      t.string :authentication
      t.string :openssl_verify_mode
      t.timestamps
    end

    create_table :email_reasons, id: :uuid, default: "uuidv7()" do |t|
      t.string :body
      t.timestamps
    end

    create_table :email_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template, type: :uuid
      t.string :mail_from
      t.string :message_object_id
      t.string :mailer
      t.string :action_name
      t.string :params
      t.string :subject
      t.string :mail_to
      t.string :cc_to
      t.string :sent_status
      t.string :sent_string
      t.timestamps
    end

    create_table :alipay_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :type
      t.string :name
      t.string :appid
      t.string :private_rsa
      t.timestamps
    end

    create_table :attend_overtimes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.datetime :start_at
      t.datetime :finish_at
      t.string :note
      t.string :comment
      t.float :hours
      t.string :state
      t.timestamps
    end

    create_table :attend_financial_months, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.date :begin_date
      t.date :end_date
      t.string :working_days
      t.string :color
      t.timestamps
    end

    create_table :attend_extra_days, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.date :the_day
      t.string :name
      t.string :kind
      t.string :scope
      t.timestamps
    end

    create_table :attend_attendance_stats, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :financial_month, type: :uuid
      t.string :costed_absence
      t.string :redeeming_absence
      t.string :free_absence
      t.integer :allowance_days
      t.integer :late_days
      t.float :absence_redeeming_hours
      t.float :cost_absence_hours
      t.float :holiday_redeeming_hours
      t.boolean :processed
      t.timestamps
    end

    create_table :attend_attendance_settings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.date :effect_on
      t.date :expire_on
      t.string :on_time
      t.string :off_time
      t.string :note
      t.string :state
      t.timestamps
    end

    create_table :attend_attendance_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :attendance, type: :uuid
      t.string :source
      t.string :state
      t.string :name
      t.datetime :record_at
      t.boolean :processed
      t.string :kind
      t.string :note
      t.string :record_at_str
      t.string :number
      t.timestamps
    end

    create_table :attend_attendances, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :interval_absence, type: :uuid
      t.belongs_to :late_absence, type: :uuid
      t.belongs_to :leave_absence, type: :uuid
      t.integer :late_minutes
      t.integer :leave_minutes
      t.float :overtime_hours
      t.float :attend_hours
      t.float :interval_hours
      t.float :total_hours
      t.date :attend_on
      t.datetime :start_at
      t.datetime :finish_at
      t.datetime :interval_start_at
      t.datetime :interval_finish_at
      t.string :kind
      t.integer :absence_minutes
      t.boolean :absence_redeeming
      t.jsonb :lost_logs
      t.boolean :workday
      t.boolean :processed
      t.timestamps
    end

    create_table :attend_absence_stats, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.string :year
      t.float :annual_days
      t.float :annual_add
      t.float :left_annual_days
      t.float :vacation_days
      t.string :details
      t.timestamps
    end

    create_table :attend_absences, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :merged, type: :uuid
      t.string :type
      t.string :state
      t.float :hours
      t.string :kind
      t.datetime :start_at
      t.datetime :finish_at
      t.string :note
      t.string :comment
      t.boolean :redeeming
      t.jsonb :redeeming_days
      t.boolean :processed
      t.boolean :divided
      t.timestamps
    end

    create_table :douyin_shops, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :appid, index: true
      t.string :poi_id
      t.timestamps
    end

    create_table :douyin_orders, id: :uuid, default: "uuidv7()" do |t|
      t.string :poi_id
      t.string :appid
      t.string :code
      t.string :verify_id
      t.string :certificate_id
      t.string :origin_code
      t.string :account_id
      t.string :uuid
      t.string :verify_token
      t.jsonb :extra
      t.jsonb :verify_results
      t.timestamps
    end

    create_table :douyin_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.string :open_id
      t.timestamps
    end

    create_table :growth_reward_incomes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :reward, type: :uuid
      t.belongs_to :user, type: :uuid
      t.decimal :reward_amount
      t.timestamps
    end

    create_table :growth_reward_expenses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :reward, type: :uuid
      t.belongs_to :aim, type: :uuid
      t.decimal :amount
      t.timestamps
    end

    create_table :growth_rewards, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :entity, polymorphic: true, type: :uuid
      t.decimal :min_piece
      t.decimal :max_piece
      t.decimal :amount
      t.decimal :income_amount
      t.decimal :expense_amount
      t.datetime :start_at
      t.datetime :finish_at
      t.boolean :enabled
      t.integer :lock_version
      t.timestamps
    end

    create_table :growth_praise_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :reward, type: :uuid
      t.belongs_to :entity, polymorphic: true, type: :uuid
      t.decimal :amount
      t.integer :position
      t.timestamps
    end

    create_table :growth_praise_incomes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :reward, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :earner, type: :uuid
      t.belongs_to :source, polymorphic: true, type: :uuid
      t.decimal :amount, comment: "用户打赏"
      t.decimal :profit_amount, comment: "平台收入"
      t.decimal :royalty_amount, comment: "作者分成"
      t.decimal :reward_amount, comment: "赏金池"
      t.string :state
      t.timestamps
    end

    create_table :growth_aim_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :aim, type: :uuid
      t.string :text_year
      t.string :text_month
      t.string :text_week
      t.string :text_date
      t.string :state
      t.integer :reward_amount
      t.integer :aim_entities_count
      t.timestamps
    end

    create_table :growth_aim_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :aim, type: :uuid
      t.belongs_to :entity, polymorphic: true, type: :uuid
      t.string :serial_number
      t.string :ip
      t.string :code
      t.boolean :rewarded
      t.datetime :created_at, null: false
    end

    create_table :growth_aim_entities, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :aim, type: :uuid
      t.belongs_to :entity, polymorphic: true, type: :uuid
      t.belongs_to :reward_expense, type: :uuid
      t.string :text_year
      t.string :text_month
      t.string :text_week
      t.string :text_date
      t.integer :present_point
      t.string :state
      t.datetime :last_access_at
      t.string :ip
      t.decimal :reward_amount
      t.integer :aim_logs_count
      t.timestamps
    end

    create_table :growth_aim_codes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :aim, type: :uuid
      t.string :controller_path
      t.string :action_name
      t.string :code, null: false
      t.timestamps
    end

    create_table :growth_aims, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :unit
      t.string :repeat_type
      t.decimal :rate
      t.integer :task_point
      t.integer :reward_point
      t.integer :reward_amount
      t.boolean :verbose
      t.timestamps
    end

    create_table :wechat_user_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member_inviter, type: :uuid
      t.belongs_to :user_tagged, type: :uuid
      t.string :tag_name, index: true
      t.string :appid, index: true
      t.string :open_id, index: true
      t.boolean :synced
      t.timestamps
    end

    create_table :wechat_template_key_words, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :template_config, type: :uuid
      t.integer :position
      t.integer :kid
      t.string :name
      t.string :note
      t.string :example
      t.string :rule
      t.string :mapping
      t.string :color
      t.timestamps
    end

    create_table :wechat_templates, id: :uuid, default: "uuidv7()" do |t|
      t.string :template_id
      t.string :title
      t.string :content
      t.string :example
      t.integer :template_type
      t.string :appid, index: true
      t.string :template_kind
      t.timestamps
    end

    create_table :wechat_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :tagging, polymorphic: true, type: :uuid
      t.belongs_to :user_tag, type: :uuid
      t.string :appid, index: true
      t.string :name
      t.integer :count
      t.integer :user_tags_count
      t.integer :tag_id
      t.string :kind
      t.timestamps
    end

    create_table :wechat_supporters, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :corp, type: :uuid
      t.string :avatar
      t.string :name
      t.string :open_kfid
      t.boolean :manage_privilege
      t.string :corpid, index: true
      t.timestamps
    end

    create_table :wechat_suite_receives, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :provider, type: :uuid
      t.string :suiteid, index: true
      t.string :corpid, index: true
      t.string :auth_corp_id
      t.string :user_id, index: true
      t.string :agent_id
      t.string :msg_id
      t.string :msg_type
      t.string :event
      t.string :event_key
      t.string :encrypt_data
      t.jsonb :message_hash
      t.string :info_type
      t.string :msg_format
      t.timestamps
    end

    create_table :wechat_suites, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :corp_id
      t.string :suite_id
      t.string :secret
      t.string :token
      t.string :encoding_aes_key
      t.string :suite_ticket
      t.string :suite_ticket_pre
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :pre_auth_code
      t.datetime :pre_auth_code_expires_at
      t.string :redirect_controller
      t.string :redirect_action, comment: "默认跳转"
      t.string :kind
      t.timestamps
    end

    create_table :wechat_responses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :reply, type: :uuid
      t.string :match_value
      t.boolean :contain
      t.boolean :enabled
      t.datetime :expire_at
      t.string :appid, index: true
      t.timestamps
    end

    create_table :wechat_request_responses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :response, type: :uuid
      t.string :request_type
      t.string :appid
      t.timestamps
    end

    create_table :wechat_registers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :id_name
      t.string :id_number
      t.string :email_code
      t.string :state
      t.string :appid
      t.string :password
      t.string :mobile
      t.string :mobile_code
      t.string :personal_wechat
      t.string :organ_name
      t.string :organ_code
      t.timestamps
    end

    create_table :wechat_receivers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app_payee, type: :uuid
      t.string :account
      t.string :name
      t.string :custom_relation
      t.jsonb :res
      t.string :receiver_type
      t.string :relation_type
      t.timestamps
    end

    create_table :wechat_qy_medias, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :medium, polymorphic: true, type: :uuid
      t.string :corpid, index: true
      t.string :suite_id, index: true
      t.string :media_id
      t.string :url
      t.string :medium_attach
      t.timestamps
    end

    create_table :wechat_provider_organs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :provider, type: :uuid
      t.string :corpid
      t.string :open_corpid
      t.timestamps
    end

    create_table :wechat_providers, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :corp_id, index: true
      t.string :provider_secret
      t.string :token
      t.string :encoding_aes_key
      t.string :access_token
      t.datetime :access_token_expires_at
      t.timestamps
    end

    create_table :wechat_platform_tickets, id: :uuid, default: "uuidv7()" do |t|
      t.string :signature
      t.integer :timestamp
      t.string :nonce
      t.string :msg_signature
      t.string :appid
      t.string :ticket_data
      t.jsonb :message_hash
      t.string :info_type
      t.timestamps
    end

    create_table :wechat_platform_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :platform, type: :uuid
      t.string :user_version
      t.string :user_desc
      t.integer :template_id
      t.string :audit_status
      t.timestamps
    end

    create_table :wechat_partners, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :appid, comment: "sp_appid"
      t.string :mch_id, comment: "支付专用、商户号"
      t.string :key
      t.string :key_v3
      t.string :serial_no
      t.string :apiclient_cert
      t.string :apiclient_key
      t.datetime :platform_effective_at
      t.datetime :platform_expire_at
      t.string :platform_serial_no
      t.jsonb :encrypt_certificate
      t.timestamps
    end

    create_table :wechat_news_reply_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :news_reply, type: :uuid
      t.string :title
      t.string :description
      t.string :url
      t.string :raw_pic_url
      t.timestamps
    end

    create_table :wechat_menu_root_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :menu_root, type: :uuid
      t.string :name
      t.string :appid
      t.integer :position
      t.timestamps
    end

    create_table :wechat_menu_roots, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end

    create_table :wechat_menu_disables, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :menu, type: :uuid
      t.string :appid, index: true
      t.timestamps
    end

    create_table :wechat_medias, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :source, polymorphic: true, type: :uuid
      t.belongs_to :user, type: :uuid
      t.string :media_id
      t.string :appid
      t.string :attachment_name
      t.timestamps
    end

    create_table :wechat_hooks, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :response, type: :uuid
      t.belongs_to :hooked, polymorphic: true, type: :uuid
      t.timestamps
    end

    create_table :wechat_extractors, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :response, type: :uuid
      t.string :name
      t.string :prefix
      t.string :suffix
      t.boolean :more
      t.boolean :serial
      t.integer :serial_start
      t.time :start_at
      t.time :finish_at
      t.string :valid_response
      t.string :invalid_response
      t.timestamps
    end

    create_table :wechat_extractions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :request, type: :uuid
      t.belongs_to :extractor, type: :uuid
      t.string :name
      t.string :matched
      t.integer :serial_number
      t.timestamps
    end

    create_table :wechat_corp_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :corpid
      t.string :suite_id, index: true
      t.string :userid, index: true
      t.string :device_id
      t.string :user_ticket
      t.datetime :ticket_expires_at
      t.string :open_userid
      t.string :open_id
      t.string :identity
      t.string :name
      t.string :avatar_url
      t.string :qr_code
      t.jsonb :department
      t.integer :follows_count
      t.string :gender
      t.timestamps
    end

    create_table :wechat_corp_external_users, id: :uuid, default: "uuidv7()" do |t|
      t.string :uid, index: true
      t.string :unionid, index: true
      t.string :external_userid, index: true
      t.string :pending_id
      t.string :corpid, index: true
      t.string :subject_type
      t.timestamps
    end

    create_table :wechat_corps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :jsapi_ticket
      t.datetime :jsapi_ticket_expires_at
      t.boolean :inviting, comment: "可邀请加入"
      t.string :user_name
      t.string :domain
      t.string :url_link
      t.string :confirm_name
      t.string :confirm_content
      t.string :type
      t.string :name
      t.string :corpid, index: true
      t.string :open_corpid, index: true
      t.string :agentid
      t.string :corp_type
      t.string :subject_type
      t.datetime :verified_end_at
      t.string :square_logo_url
      t.integer :user_max
      t.string :full_name
      t.string :wxqrcode
      t.string :industry
      t.string :sub_industry
      t.string :location
      t.jsonb :auth_corp_info
      t.jsonb :auth_user_info
      t.jsonb :register_code_info
      t.jsonb :agent
      t.string :agent_ticket
      t.datetime :agent_ticket_expires_at
      t.string :permanent_code
      t.string :suite_id
      t.string :secret
      t.string :token
      t.string :encoding_aes_key
      t.boolean :debug
      t.timestamps
    end

    create_table :wechat_contacts, id: :uuid, default: "uuidv7()" do |t|
      t.string :corpid
      t.string :userid
      t.string :part_id
      t.string :config_id
      t.string :qr_code
      t.string :remark
      t.string :state
      t.boolean :skip_verify
      t.string :suite_id
      t.timestamps
    end

    create_table :wechat_category_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "wechat/category_anc_desc_idx"
    end

    create_table :wechat_categories, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.string :name
      t.integer :level
      t.string :scope
      t.string :kind
      t.jsonb :extra
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :wechat_auths, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :platform, type: :uuid
      t.belongs_to :request, type: :uuid
      t.string :auth_code
      t.datetime :auth_code_expires_at
      t.boolean :testcase
      t.timestamps
    end

    create_table :wechat_app_configs, id: :uuid, default: "uuidv7()" do |t|
      t.string :appid, index: true
      t.string :value
      t.string :key
      t.timestamps
    end

    create_table :wechat_scenes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :handle, polymorphic: true, type: :uuid
      t.string :match_value
      t.string :tag_name
      t.integer :expire_seconds
      t.datetime :expire_at
      t.string :qrcode_ticket
      t.string :qrcode_url
      t.string :appid, index: true
      t.string :menu_id
      t.string :note
      t.string :state_uuid
      t.string :env_version
      t.string :aim
      t.timestamps
    end

    create_table :wechat_platforms, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :public_agency, type: :uuid
      t.belongs_to :program_agency, type: :uuid
      t.string :encoding_aes_key
      t.string :name
      t.string :appid
      t.string :secret
      t.string :token
      t.string :verify_ticket
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :pre_auth_code
      t.datetime :pre_auth_code_expires_at
      t.string :domain
      t.timestamps
    end

    create_table :wechat_payee_domains, id: :uuid, default: "uuidv7()" do |t|
      t.string :mch_id, index: true
      t.string :domain, index: true
      t.timestamps
    end

    create_table :wechat_payee_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :mch_id, index: true
      t.string :appid, index: true
      t.boolean :enabled
      t.timestamps
    end

    create_table :wechat_payees, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :partner, type: :uuid
      t.string :type
      t.string :name
      t.string :mch_id, comment: "支付专用、商户号"
      t.string :key
      t.string :key_v3
      t.string :serial_no
      t.string :apiclient_cert
      t.string :apiclient_key
      t.datetime :platform_effective_at
      t.datetime :platform_expire_at
      t.string :platform_serial_no
      t.jsonb :encrypt_certificate
      t.timestamps
    end

    create_table :wechat_services, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :request, type: :uuid
      t.string :msgtype
      t.string :type
      t.string :value
      t.string :appid
      t.string :open_id
      t.jsonb :body
      t.timestamps
    end

    create_table :wechat_requests, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :scene_organ, type: :uuid
      t.belongs_to :receive, type: :uuid
      t.belongs_to :platform, type: :uuid
      t.datetime :sent_at
      t.string :type
      t.string :body
      t.string :tag_name
      t.jsonb :raw_body
      t.string :msg_type
      t.string :event
      t.string :event_key
      t.string :appid, index: true
      t.string :open_id, index: true
      t.string :userid, index: true
      t.integer :handle_id
      t.jsonb :reply_body
      t.string :aim
      t.timestamps
    end

    create_table :wechat_replies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :platform, type: :uuid
      t.belongs_to :messaging, polymorphic: true, type: :uuid
      t.belongs_to :request, type: :uuid
      t.belongs_to :message_send, type: :uuid
      t.string :type
      t.string :value
      t.string :title
      t.string :description
      t.jsonb :body
      t.string :appid, index: true
      t.string :open_id
      t.string :nonce
      t.datetime :created_at
    end

    create_table :wechat_notices, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :notification, type: :uuid
      t.belongs_to :template, type: :uuid
      t.belongs_to :msg_request, type: :uuid
      t.string :link
      t.string :msg_id
      t.string :status
      t.string :type
      t.string :appid
      t.string :open_id
      t.jsonb :result
      t.timestamps
    end

    create_table :wechat_messages, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :platform, type: :uuid
      t.string :type
      t.string :appid, index: true
      t.string :open_id, index: true
      t.string :msg_id
      t.string :msg_type
      t.string :content
      t.string :encrypt_data
      t.jsonb :message_hash
      t.string :info_type
      t.string :msg_format
      t.timestamps
    end

    create_table :wechat_menu_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :menu, type: :uuid
      t.belongs_to :menu_root, type: :uuid
      t.belongs_to :menu_root_app, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.belongs_to :tag, type: :uuid
      t.string :type
      t.string :name
      t.string :value
      t.string :mp_appid
      t.string :mp_pagepath
      t.string :appid, index: true
      t.integer :position
      t.timestamps
    end

    create_table :wechat_menus, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :menu_root, type: :uuid
      t.string :type
      t.string :name
      t.string :value
      t.string :mp_appid
      t.string :mp_pagepath
      t.integer :position
      t.timestamps
    end

    create_table :wechat_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :platform, type: :uuid
      t.belongs_to :platform_template, type: :uuid
      t.integer :auditid
      t.jsonb :version_info
      t.jsonb :webview_domain_registered
      t.string :audit_status
      t.string :confirm_name
      t.string :confirm_content
      t.string :ticket
      t.string :weapp_id, comment: "关联的小程序"
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :jsapi_ticket
      t.datetime :jsapi_ticket_expires_at
      t.string :encoding_aes_key
      t.string :type
      t.string :appid
      t.string :platform_appid
      t.string :refresh_token
      t.string :func_infos, array: true
      t.string :nick_name
      t.string :head_img
      t.string :user_name
      t.string :principal_name
      t.string :alias_name
      t.string :qrcode_url
      t.jsonb :business_info
      t.string :service_type
      t.string :verify_type
      t.jsonb :extra
      t.string :logo_media_id
      t.boolean :enabled
      t.boolean :global
      t.string :secret
      t.string :token
      t.boolean :encrypt_mode
      t.string :url_link
      t.boolean :debug
      t.string :open_appid
      t.string :oauth_domain
      t.string :webview_domain
      t.timestamps
    end

    create_table :wechat_template_configs, id: :uuid, default: "uuidv7()" do |t|
      t.string :type
      t.string :title
      t.string :tid
      t.string :description
      t.string :notifiable_type
      t.string :code
      t.string :content
      t.timestamps
    end

    create_table :finance_taxon_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "finance/taxon_anc_desc_idx"
    end

    create_table :finance_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.integer :position
      t.boolean :take_stock, comment: "是否有库存"
      t.boolean :individual, comment: "是否可盘点"
      t.timestamps
    end

    create_table :finance_stocks, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :assessment, type: :uuid
      t.decimal :ratio
      t.decimal :assess_amount
      t.integer :amount, comment: "发行量"
      t.integer :expense_amount
      t.jsonb :expense_detail
      t.string :note
      t.timestamps
    end

    create_table :finance_fund_incomes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :fund, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :financial, polymorphic: true, type: :uuid
      t.decimal :amount
      t.boolean :visible
      t.string :note
      t.string :state
      t.timestamps
    end

    create_table :finance_funds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.string :name
      t.decimal :amount
      t.decimal :budget_amount
      t.jsonb :budget_detail
      t.decimal :expense_amount
      t.jsonb :expense_detail
      t.string :note
      t.string :sku
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
      t.timestamps
    end

    create_table :finance_expense_members, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :expense, type: :uuid
      t.belongs_to :payment_method, type: :uuid
      t.decimal :amount
      t.decimal :advance
      t.string :state
      t.string :note
      t.timestamps
    end

    create_table :finance_expense_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :expense, type: :uuid
      t.belongs_to :budget, type: :uuid
      t.belongs_to :financial_taxon, type: :uuid
      t.decimal :budget_amount
      t.decimal :amount
      t.string :note
      t.string :state
      t.integer :quantity
      t.decimal :price
      t.timestamps
    end

    create_table :finance_assessments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.decimal :amount
      t.decimal :trustee_amount
      t.timestamps
    end

    create_table :finance_expenses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :creator, type: :uuid
      t.belongs_to :payment_method, type: :uuid
      t.belongs_to :financial, polymorphic: true, type: :uuid
      t.belongs_to :budget, type: :uuid
      t.belongs_to :fund, type: :uuid
      t.belongs_to :stock, type: :uuid
      t.belongs_to :financial_taxon, type: :uuid
      t.belongs_to :payout, type: :uuid
      t.string :type
      t.string :state
      t.string :subject
      t.decimal :amount
      t.string :note
      t.integer :invoices_count
      t.timestamps
    end

    create_table :space_rooms, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :station, type: :uuid
      t.belongs_to :building, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :code
      t.integer :floor
      t.integer :grids_count
      t.timestamps
    end

    create_table :space_grids, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :room, type: :uuid
      t.string :name
      t.string :code
      t.integer :width
      t.integer :height
      t.integer :length
      t.integer :floor
      t.timestamps
    end

    create_table :space_desks, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :room, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :code
      t.integer :width
      t.integer :height
      t.integer :length
      t.timestamps
    end

    create_table :space_buildings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :station, type: :uuid
      t.string :name
      t.string :code
      t.timestamps
    end

    create_table :interact_stars, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :starred, polymorphic: true, type: :uuid
      t.belongs_to :user, type: :uuid
      t.timestamps
    end

    create_table :interact_comments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :parent, type: :uuid
      t.belongs_to :commentable, polymorphic: true, type: :uuid
      t.string :title
      t.string :content
      t.string :state
      t.float :score
      t.integer :liked_count
      t.integer :star_count
      t.timestamps
    end

    create_table :interact_attitudes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :attitudinal, polymorphic: true, type: :uuid
      t.string :opinion
      t.timestamps
    end

    create_table :interact_abuses, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :abusement, polymorphic: true, type: :uuid
      t.string :note
      t.timestamps
    end

    create_table :markdown_posts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :git, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.string :markdown
      t.string :html
      t.string :layout
      t.string :path
      t.string :slug
      t.string :catalog_path
      t.string :oid
      t.boolean :published
      t.boolean :shared
      t.boolean :ppt
      t.boolean :nav, comment: "是否导航菜单"
      t.datetime :last_commit_at
      t.string :target
      t.timestamps
    end

    create_table :markdown_catalogs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :git, type: :uuid
      t.string :name
      t.string :path
      t.string :parent_path
      t.integer :position
      t.boolean :nav, comment: "是否导航菜单"
      t.integer :depth
      t.string :home_path
      t.timestamps
    end

    create_table :markdown_assets, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :git, type: :uuid
      t.string :name
      t.string :path
      t.string :download_url
      t.string :sha
      t.timestamps
    end

    create_table :markdown_gits, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :identity
      t.string :type
      t.string :base_name
      t.string :working_directory
      t.string :remote_url
      t.string :last_commit_message
      t.datetime :last_commit_at
      t.string :secret
      t.timestamps
    end

    create_table :qingflow_versions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :key
      t.string :name
      t.string :number
      t.string :linker
      t.datetime :sync_forms_at
      t.timestamps
    end

    create_table :qingflow_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :userid
      t.string :name
      t.string :email
      t.string :mobile
      t.boolean :active
      t.boolean :disabled
      t.datetime :last_sync_at
      t.jsonb :depart_ids
      t.jsonb :role_ids
      t.integer :uid
      t.string :token
      t.timestamps
    end

    create_table :qingflow_pdf_generators, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :qingflow_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :item, type: :uuid
      t.belongs_to :related, polymorphic: true, type: :uuid
      t.string :exception
      t.jsonb :exception_backtrace
      t.timestamps
    end

    create_table :qingflow_item_temps, id: :uuid, default: "uuidv7()" do |t|
      t.string :record_key
      t.jsonb :params
      t.string :uid
      t.string :provider
      t.integer :operations_count
      t.string :state
      t.timestamps
    end

    create_table :qingflow_item_statistics, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :item, type: :uuid
      t.string :key
      t.jsonb :params
      t.jsonb :result
      t.timestamps
    end

    create_table :qingflow_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :version, type: :uuid
      t.string :applyid, index: true
      t.string :uid, index: true
      t.jsonb :answers
      t.string :linked_uid
      t.jsonb :primary_attrs
      t.jsonb :attrs
      t.integer :logs_count
      t.string :source
      t.string :record_key
      t.string :record_code
      t.jsonb :cached_answers
      t.jsonb :full_answers
      t.jsonb :cached_table
      t.jsonb :code_answers
      t.jsonb :title_answers
      t.jsonb :params
      t.datetime :last_sync_at
      t.datetime :apply_at
      t.datetime :apply_update_at
      t.jsonb :linked_audits
      t.jsonb :linked_logs
      t.string :note
      t.timestamps
    end

    create_table :qingflow_group_forms, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :application, type: :uuid
      t.belongs_to :group, type: :uuid
      t.belongs_to :form, type: :uuid
      t.string :queid
      t.string :title
      t.integer :position
      t.timestamps
    end

    create_table :qingflow_groups, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :pdf_generator, type: :uuid
      t.belongs_to :application, type: :uuid
      t.string :title
      t.string :description
      t.string :pdf
      t.integer :position
      t.boolean :enabled
      t.timestamps
    end

    create_table :qingflow_form_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "qingflow/form_anc_desc_idx"
    end

    create_table :qingflow_forms, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :meta_column, type: :uuid
      t.belongs_to :group, type: :uuid
      t.jsonb :parent_ancestors
      t.string :title
      t.string :full_title
      t.string :code
      t.string :alias_title
      t.integer :queid
      t.integer :que_type
      t.jsonb :options
      t.string :record_name
      t.string :column_name
      t.boolean :display
      t.boolean :primary
      t.boolean :modeling
      t.boolean :linked
      t.boolean :required
      t.string :foreign_key
      t.integer :position
      t.string :record_key, index: true
      t.datetime :synced_at
      t.timestamps
    end

    create_table :qingflow_files, id: :uuid, default: "uuidv7()" do |t|
      t.string :url
      t.string :rule
      t.string :classifier
      t.jsonb :result
      t.jsonb :replace
      t.timestamps
    end

    create_table :qingflow_export_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :export, type: :uuid
      t.jsonb :filter
      t.jsonb :table_filter
      t.jsonb :import_filter
      t.string :email
      t.jsonb :uids
      t.datetime :uploaded_at
      t.integer :export_items_count
      t.timestamps
    end

    create_table :qingflow_export_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :export_user, type: :uuid
      t.string :uid
      t.jsonb :fields
      t.integer :position
      t.boolean :header
      t.string :record_key
      t.integer :repeat_index
      t.jsonb :answer_params
      t.timestamps
    end

    create_table :qingflow_exports, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :application, type: :uuid
      t.belongs_to :template, type: :uuid
      t.string :name
      t.string :code
      t.jsonb :parameters
      t.jsonb :formats
      t.jsonb :editable
      t.timestamps
    end

    create_table :qingflow_applications, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :app, type: :uuid
      t.string :name
      t.string :code
      t.string :key
      t.datetime :sync_forms_at
      t.datetime :sync_items_at
      t.integer :forms_count
      t.string :qsource
      t.string :view_key
      t.string :tag_str
      t.string :job_id
      t.timestamps
    end

    create_table :qingflow_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :source, type: :uuid
      t.string :name
      t.string :uuid
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.string :base_url
      t.string :host
      t.datetime :sync_users_at
      t.string :client_id
      t.string :client_secret
      t.timestamps
    end

    create_table :qingflow_alias_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "qingflow/alias_anc_desc_idx"
    end

    create_table :qingflow_aliases, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :version, type: :uuid
      t.jsonb :parent_ancestors
      t.string :title
      t.string :full_title
      t.integer :queid
      t.integer :que_type
      t.jsonb :options
      t.datetime :synced_at
      t.timestamps
    end

    create_table :qingflow_operations, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :operate, polymorphic: true, type: :uuid
      t.belongs_to :app, type: :uuid
      t.jsonb :params
      t.string :request_id
      t.string :result
      t.string :code
      t.string :note
      t.boolean :auditable
      t.boolean :syncing
      t.boolean :audit_result
      t.string :applyid
      t.string :apply_user
      t.string :linker_type
      t.string :record_key
      t.timestamps
    end

    create_table :qingflow_tools, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :type
      t.string :uid
      t.jsonb :request
      t.jsonb :response
      t.timestamps
    end

    create_table :qingflow_linkers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :type
      t.jsonb :request
      t.jsonb :response
      t.string :uid
      t.string :version_number
      t.string :source
      t.integer :operations_count
      t.datetime :operated_at
      t.string :job_id
      t.timestamps
    end

    create_table :bluetooth_errs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :bluetooth_devices, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :print_jia_bo_printers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :jia_bo_app, type: :uuid
      t.string :device_id
      t.string :dev_name
      t.string :grp_id
      t.string :dev_id
      t.boolean :online
      t.string :cmd_type
      t.timestamps
    end

    create_table :print_jia_bo_apps, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :member_code
      t.string :api_key
      t.integer :jia_bo_printers_count
      t.timestamps
    end

    create_table :print_ip_printers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :ip
      t.string :port
      t.timestamps
    end

    create_table :print_devices, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :printer, polymorphic: true, type: :uuid
      t.string :aim
      t.boolean :online
      t.timestamps
    end

    create_table :one_ai_system_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :system, type: :uuid
      t.belongs_to :app, type: :uuid
      t.timestamps
    end

    create_table :one_ai_systems, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :content
      t.timestamps
    end

    create_table :one_ai_chats, id: :uuid, default: "uuidv7()" do |t|
      t.string :title
      t.timestamps
    end

    create_table :one_ai_app_models, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :name
      t.boolean :default
      t.timestamps
    end

    create_table :one_ai_messages, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :chat, type: :uuid
      t.string :type
      t.string :content
      t.timestamps
    end

    create_table :one_ai_apps, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :type
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :base_url
      t.integer :position
      t.timestamps
    end

    create_table :factory_unifiers, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    create_table :factory_taxon_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :provide, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.boolean :default
      t.timestamps
    end

    create_table :factory_taxon_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "factory/taxon_anc_desc_idx"
    end

    create_table :factory_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :factory_taxon, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.integer :position
      t.boolean :take_stock, comment: "可盘点"
      t.boolean :enabled
      t.boolean :nav, comment: "单独分类"
      t.integer :products_count
      t.integer :provides_count
      t.integer :taxon_components_count
      t.timestamps
    end

    create_table :factory_stock_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :production, type: :uuid
      t.belongs_to :source, polymorphic: true, type: :uuid
      t.string :title
      t.string :tag_str
      t.decimal :amount
      t.decimal :stock
      t.timestamps
    end

    create_table :factory_serial_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "factory/serial_anc_desc_idx"
    end

    create_table :factory_serials, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :brand, type: :uuid
      t.belongs_to :parent, type: :uuid
      t.string :name
      t.integer :position
      t.integer :products_count
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :factory_scene_automatics, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.integer :advance_days
      t.timestamps
    end

    create_table :factory_scenes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.integer :book_start_days
      t.time :book_start_at
      t.integer :book_finish_days
      t.time :book_finish_at
      t.time :deliver_start_at
      t.time :deliver_finish_at
      t.boolean :specialty
      t.timestamps
    end

    create_table :factory_production_spaces, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :production, type: :uuid
      t.belongs_to :grid, type: :uuid
      t.belongs_to :room, type: :uuid
      t.belongs_to :desk, type: :uuid
      t.belongs_to :building, type: :uuid
      t.belongs_to :station, type: :uuid
      t.timestamps
    end

    create_table :factory_production_carts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :cart, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :production, type: :uuid
      t.string :state
      t.datetime :customized_at
      t.decimal :original_price
      t.timestamps
    end

    create_table :factory_product_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :provide, type: :uuid
      t.belongs_to :product, type: :uuid
      t.boolean :default
      t.timestamps
    end

    create_table :factory_product_produces, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :product, type: :uuid
      t.belongs_to :produce, type: :uuid
      t.integer :position
      t.datetime :start_at
      t.datetime :finish_at
      t.timestamps
    end

    create_table :factory_factory_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :scene, type: :uuid
      t.string :name
      t.integer :position
      t.integer :factory_providers_count
      t.timestamps
    end

    create_table :factory_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.belongs_to :factory_provider, type: :uuid
      t.string :name
      t.string :invite_token
      t.timestamps
    end

    create_table :factory_production_provides, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :provide, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :production, type: :uuid
      t.belongs_to :provide_config, polymorphic: true, type: :uuid
      t.belongs_to :upstream_product, type: :uuid
      t.belongs_to :upstream_production, type: :uuid
      t.decimal :cost_price
      t.boolean :default
      t.timestamps
    end

    create_table :factory_production_parts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :part_taxon, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :production, type: :uuid
      t.belongs_to :part, type: :uuid
      t.belongs_to :component, type: :uuid
      t.integer :number
      t.timestamps
    end

    create_table :factory_production_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :production, type: :uuid
      t.belongs_to :product_item, type: :uuid
      t.belongs_to :grid, type: :uuid
      t.belongs_to :room, type: :uuid
      t.belongs_to :building, type: :uuid
      t.belongs_to :station, type: :uuid
      t.string :code
      t.decimal :amount
      t.datetime :came_at
      t.string :state
      t.timestamps
    end

    create_table :factory_productions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :product_host, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :factory_taxon, type: :uuid
      t.string :name
      t.string :qr_code
      t.decimal :price
      t.decimal :cost_price, comment: "成本价"
      t.decimal :profit_price, comment: "利润"
      t.string :str_part_ids, index: true
      t.boolean :default
      t.boolean :enabled
      t.boolean :automatic
      t.boolean :presell, comment: "预售"
      t.string :link
      t.integer :position
      t.decimal :stock
      t.jsonb :last_stock_log
      t.string :word, comment: "搜索关键词"
      t.string :state
      t.string :sku
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
      t.integer :rent_charges_count
      t.string :rent_unit
      t.timestamps
    end

    create_table :factory_produces, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :content
      t.timestamps
    end

    create_table :factory_part_plans, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :part, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :production, type: :uuid
      t.datetime :start_at
      t.datetime :finish_at
      t.string :state
      t.integer :purchased_count
      t.integer :received_count
      t.timestamps
    end

    create_table :factory_products, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :unifier, type: :uuid
      t.belongs_to :factory_taxon, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :brand, type: :uuid
      t.string :name
      t.string :description
      t.string :qr_prefix
      t.string :sku, index: true
      t.boolean :published
      t.boolean :specialty
      t.decimal :base_price
      t.integer :order_items_count
      t.integer :productions_count
      t.integer :product_parts_count
      t.integer :fits_count
      t.integer :position
      t.decimal :profit_margin
      t.decimal :min_price
      t.decimal :max_price
      t.jsonb :taxon_ancestors
      t.timestamps
    end

    create_table :factory_fits, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :product, type: :uuid
      t.belongs_to :production, type: :uuid
      t.belongs_to :part_brand, type: :uuid
      t.belongs_to :part_serial, type: :uuid
      t.belongs_to :part_product, type: :uuid
      t.belongs_to :part_production, type: :uuid
      t.string :grade
      t.timestamps
    end

    create_table :factory_factory_providers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :factory_taxon, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.timestamps
    end

    create_table :factory_component_parts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :component, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :part, type: :uuid
      t.boolean :default
      t.integer :min
      t.integer :max
      t.timestamps
    end

    create_table :factory_brands, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :code
      t.integer :products_count
      t.timestamps
    end

    create_table :factory_components, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :part_taxon, type: :uuid
      t.belongs_to :taxon, type: :uuid
      t.belongs_to :product, type: :uuid
      t.string :type
      t.string :name
      t.integer :min_select
      t.integer :max_select
      t.integer :component_parts_count
      t.boolean :multiple
      t.timestamps
    end

    create_table :factory_produce_plans, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.string :title
      t.date :produce_on
      t.integer :serial_number
      t.datetime :book_finish_at
      t.datetime :book_start_at
      t.integer :production_plans_count
      t.string :state
      t.timestamps
    end

    create_table :factory_production_plans, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :station, type: :uuid
      t.belongs_to :production, type: :uuid
      t.belongs_to :product, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.datetime :start_at
      t.datetime :finish_at
      t.date :produce_on
      t.string :state
      t.integer :planned_count
      t.integer :production_items_count
      t.boolean :specialty, comment: "主推"
      t.integer :trade_items_count
      t.timestamps
    end

    create_table :trade_wallet_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :description
      t.string :unit_name
      t.string :rate, comment: "相对于默认货币的比率"
      t.integer :wallets_count
      t.string :code
      t.string :platform
      t.boolean :enabled
      t.string :unit
      t.integer :digit, comment: "精确到小数点后几位"
      t.string :appid, comment: "推广微信公众号"
      t.timestamps
    end

    create_table :trade_wallet_sells, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :operator, type: :uuid
      t.belongs_to :wallet, type: :uuid
      t.belongs_to :item, type: :uuid
      t.belongs_to :selled, polymorphic: true, type: :uuid
      t.decimal :amount
      t.string :note
      t.string :state
      t.timestamps
    end

    create_table :trade_wallet_prepayments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :wallet_template, type: :uuid
      t.string :token
      t.decimal :amount
      t.datetime :expire_at
      t.boolean :lawful
      t.timestamps
    end

    create_table :trade_wallet_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :wallet, type: :uuid
      t.belongs_to :source, polymorphic: true, type: :uuid
      t.string :title
      t.string :tag_str
      t.decimal :amount
      t.timestamps
    end

    create_table :trade_wallet_goods, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :wallet_template, type: :uuid
      t.belongs_to :good, polymorphic: true, type: :uuid
      t.string :wallet_code
      t.timestamps
    end

    create_table :trade_wallet_frozens, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :operator, type: :uuid
      t.belongs_to :wallet, type: :uuid
      t.belongs_to :item, type: :uuid
      t.decimal :amount
      t.string :note
      t.string :state
      t.timestamps
    end

    create_table :trade_wallet_advances, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :operator, type: :uuid
      t.belongs_to :wallet, type: :uuid
      t.belongs_to :advance, type: :uuid
      t.belongs_to :item, type: :uuid
      t.belongs_to :wallet_prepayment, type: :uuid
      t.decimal :price
      t.decimal :amount
      t.string :note
      t.string :kind
      t.string :state
      t.timestamps
    end

    create_table :trade_units, id: :uuid, default: "uuidv7()" do |t|
      t.boolean :default
      t.decimal :rate, comment: "相对于默认单位的计算比率"
      t.string :name
      t.string :code
      t.string :metering
      t.timestamps
    end

    create_table :trade_rent_charges, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :rentable, polymorphic: true, type: :uuid
      t.integer :min
      t.integer :max
      t.integer :filter_min
      t.integer :filter_max
      t.boolean :contain_min
      t.boolean :contain_max
      t.decimal :parameter
      t.jsonb :wallet_price
      t.decimal :base_price
      t.jsonb :wallet_base_price
      t.jsonb :extra
      t.timestamps
    end

    create_table :trade_refund_orders, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :order, type: :uuid
      t.belongs_to :payment, type: :uuid
      t.belongs_to :refund, type: :uuid
      t.decimal :payment_amount
      t.decimal :order_amount, comment: "对应的订单金额"
      t.string :state
      t.timestamps
    end

    create_table :trade_purchases, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :card_template, type: :uuid
      t.string :name
      t.string :sku
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
      t.string :title
      t.string :note
      t.integer :years
      t.integer :months
      t.integer :days
      t.boolean :default
      t.timestamps
    end

    create_table :trade_promote_extras, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :promote, type: :uuid
      t.string :extra_name
      t.string :column_name
      t.timestamps
    end

    create_table :trade_privileges, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :card_template, type: :uuid
      t.belongs_to :promote, type: :uuid
      t.string :name
      t.integer :amount, comment: "额度"
      t.decimal :price, comment: "价格"
      t.string :code
      t.integer :position
      t.timestamps
    end

    create_table :trade_payment_strategies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.integer :period, comment: "可延期时间，单位天"
      t.boolean :from_pay
      t.string :strategy
      t.timestamps
    end

    create_table :trade_payment_references, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :payment_method, type: :uuid
      t.string :state
      t.timestamps
    end

    create_table :trade_item_promotes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :item, type: :uuid
      t.belongs_to :promote_good, type: :uuid
      t.belongs_to :promote, type: :uuid
      t.belongs_to :promote_charge, type: :uuid
      t.string :promote_name
      t.decimal :value
      t.decimal :amount
      t.decimal :original_amount
      t.decimal :unit_price
      t.string :status
      t.timestamps
    end

    create_table :trade_holds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :item, type: :uuid
      t.belongs_to :rentable, polymorphic: true, type: :uuid
      t.decimal :amount
      t.datetime :rent_start_at
      t.datetime :rent_finish_at, comment: "实际结束时间"
      t.datetime :rent_present_finish_at, comment: "周期性计费时间"
      t.datetime :rent_estimate_finish_at, comment: "预估结束时间"
      t.integer :rent_duration
      t.integer :rent_estimate_duration
      t.jsonb :wallet_amount
      t.decimal :estimate_amount
      t.jsonb :estimate_wallet_amount
      t.decimal :invest_amount, comment: "投资分成"
      t.jsonb :extra
      t.string :job_id
      t.timestamps
    end

    create_table :trade_exchange_rates, id: :uuid, default: "uuidv7()" do |t|
      t.string :from
      t.string :to
      t.decimal :rate
      t.timestamps
    end

    create_table :trade_deliveries, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.belongs_to :order, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.boolean :fetch_oneself, comment: "自取"
      t.datetime :fetch_start_at
      t.datetime :fetch_finish_at
      t.date :produce_on, comment: "对接生产管理"
      t.string :state
      t.timestamps
    end

    create_table :trade_cart_promotes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :cart, type: :uuid
      t.belongs_to :order, type: :uuid
      t.belongs_to :promote, type: :uuid
      t.belongs_to :promote_charge, type: :uuid
      t.string :promote_name
      t.integer :sequence
      t.decimal :value
      t.decimal :original_amount, comment: "初始价格"
      t.decimal :based_amount, comment: "基于此价格计算，默认为 item 的 amount，与sequence有关"
      t.decimal :computed_amount, comment: "计算出的价格"
      t.jsonb :unit_prices
      t.decimal :amount, comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
      t.string :note, comment: "备注"
      t.boolean :edited, comment: "是否被客服改过价"
      t.string :status
      t.timestamps
    end

    create_table :trade_card_purchases, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :card, type: :uuid
      t.belongs_to :purchase, type: :uuid
      t.belongs_to :item, type: :uuid
      t.decimal :price
      t.integer :days
      t.integer :months
      t.integer :years
      t.string :note
      t.datetime :last_expire_at
      t.string :kind
      t.string :state
      t.timestamps
    end

    create_table :trade_advances, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :wallet_template, type: :uuid
      t.belongs_to :card_template, type: :uuid
      t.string :name
      t.string :sku
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
      t.decimal :amount
      t.string :apple_product_id, comment: "For 苹果应用内支付"
      t.boolean :open
      t.boolean :lawful, comment: "是否法币"
      t.timestamps
    end

    create_table :trade_addition_charges, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :addition, type: :uuid
      t.decimal :min
      t.decimal :max
      t.decimal :filter_min
      t.decimal :filter_max
      t.boolean :contain_min
      t.boolean :contain_max
      t.decimal :parameter
      t.jsonb :wallet_price
      t.decimal :base_price
      t.jsonb :wallet_base_price
      t.jsonb :extra
      t.timestamps
    end

    create_table :trade_additions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :deal, polymorphic: true, type: :uuid
      t.string :name
      t.string :short_name
      t.string :code
      t.string :unit_code
      t.string :description
      t.string :metering
      t.boolean :editable, comment: "是否可更改价格"
      t.boolean :verified
      t.jsonb :extra
      t.timestamps
    end

    create_table :trade_promote_goods, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :card_template, type: :uuid
      t.belongs_to :card, type: :uuid
      t.belongs_to :promote, type: :uuid
      t.belongs_to :good, polymorphic: true, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.string :status
      t.datetime :effect_at
      t.datetime :expire_at
      t.integer :item_promotes_count
      t.string :identity
      t.integer :use_limit
      t.virtual :over_limit, type: :boolean, as: "item_promotes_count >= use_limit", stored: true
      t.integer :blacklists_count
      t.string :aim
      t.timestamps
    end

    create_table :trade_promotes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :deal, polymorphic: true, type: :uuid
      t.string :name
      t.string :short_name
      t.string :code
      t.string :unit_code
      t.string :description
      t.string :metering
      t.boolean :editable, comment: "是否可更改价格"
      t.jsonb :extra
      t.integer :sequence
      t.timestamps
    end

    create_table :trade_payment_orders, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :order, type: :uuid
      t.belongs_to :payment, type: :uuid
      t.decimal :payment_amount
      t.decimal :order_amount
      t.string :kind
      t.string :state
      t.timestamps
    end

    create_table :trade_carts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :address, type: :uuid
      t.belongs_to :payment_strategy, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.belongs_to :desk, type: :uuid
      t.belongs_to :station, type: :uuid
      t.decimal :item_amount
      t.decimal :overall_additional_amount
      t.decimal :overall_reduced_amount
      t.decimal :original_amount, comment: "原价，应用优惠之前的价格"
      t.decimal :amount
      t.decimal :advance_amount
      t.jsonb :extra
      t.integer :lock_version
      t.string :good_type
      t.decimal :retail_price, comment: "汇总：原价"
      t.decimal :discount_price, comment: "汇总：优惠"
      t.decimal :bulk_price
      t.decimal :total_quantity
      t.integer :deposit_ratio, comment: "最小预付比例"
      t.boolean :auto, comment: "自动下单"
      t.boolean :fresh
      t.boolean :purchasable
      t.integer :items_count
      t.string :aim
      t.timestamps
    end

    create_table :trade_card_templates, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :promote, type: :uuid
      t.belongs_to :parent, type: :uuid
      t.string :name
      t.string :description
      t.string :text_color
      t.integer :cards_count
      t.string :code
      t.integer :grade, comment: "会员级别"
      t.boolean :enabled
      t.timestamps
    end

    create_table :trade_cards, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :card_template, type: :uuid
      t.belongs_to :agency, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.string :card_uuid
      t.datetime :effect_at
      t.datetime :expire_at
      t.boolean :temporary, comment: "在购物车勾选临时生效"
      t.integer :lock_version
      t.timestamps
    end

    create_table :trade_wallets, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :wallet_template, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.decimal :withdrawable_amount, comment: "可提现的额度"
      t.string :account_bank
      t.string :account_name
      t.string :account_number
      t.string :type
      t.string :name
      t.decimal :amount
      t.decimal :frozen_amount, comment: "支出：冻结金额"
      t.decimal :payout_amount, comment: "支出：提现"
      t.decimal :payment_amount, comment: "支出：钱包支付"
      t.decimal :refunded_amount, comment: "收入：退款"
      t.decimal :advances_amount, comment: "收入：主动充值"
      t.decimal :sells_amount, comment: "收入：交易入账"
      t.decimal :income_amount
      t.decimal :expense_amount
      t.integer :lock_version
      t.timestamps
    end

    create_table :trade_refunds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :operator, type: :uuid
      t.belongs_to :payment, type: :uuid
      t.belongs_to :wallet, type: :uuid
      t.string :type
      t.string :currency
      t.decimal :total_amount
      t.string :buyer_identifier
      t.string :comment
      t.datetime :refunded_at
      t.string :reason
      t.string :refund_uuid
      t.jsonb :response
      t.string :state
      t.timestamps
    end

    create_table :trade_promote_charges, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :promote, type: :uuid
      t.decimal :min
      t.decimal :max
      t.decimal :filter_min
      t.decimal :filter_max
      t.boolean :contain_min
      t.boolean :contain_max
      t.decimal :parameter
      t.jsonb :wallet_price
      t.decimal :base_price
      t.jsonb :wallet_base_price
      t.jsonb :extra
      t.string :type
      t.timestamps
    end

    create_table :trade_payouts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :wallet, type: :uuid
      t.belongs_to :operator, type: :uuid
      t.belongs_to :payable, polymorphic: true, type: :uuid
      t.string :payout_uuid
      t.string :type
      t.decimal :requested_amount
      t.decimal :actual_amount
      t.datetime :paid_at
      t.boolean :advance
      t.string :account_bank
      t.string :account_name
      t.string :account_num
      t.string :state
      t.timestamps
    end

    create_table :trade_payment_methods, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :creator, type: :uuid
      t.string :type
      t.string :account_name
      t.string :account_num
      t.string :bank
      t.boolean :verified
      t.boolean :myself
      t.jsonb :extra
      t.timestamps
    end

    create_table :trade_payments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :operator, polymorphic: true, type: :uuid
      t.belongs_to :payment_method, type: :uuid
      t.belongs_to :wallet, type: :uuid
      t.integer :payment_id, comment: "for paypal"
      t.string :appid
      t.string :type
      t.string :payment_uuid
      t.string :pay_status, comment: "记录来自服务商的状态"
      t.string :currency
      t.decimal :total_amount
      t.decimal :orders_amount, comment: "订单金额汇总"
      t.decimal :checked_amount, comment: "实际支付汇总"
      t.decimal :adjust_amount
      t.decimal :fee_amount
      t.decimal :refunded_amount
      t.decimal :income_amount, comment: "实际到账"
      t.string :notify_type
      t.datetime :notified_at
      t.string :seller_identifier
      t.string :buyer_identifier
      t.string :buyer_name
      t.string :buyer_bank
      t.string :comment
      t.boolean :verified, comment: "是否已确认收款"
      t.integer :lock_version
      t.jsonb :extra
      t.jsonb :extra_params
      t.integer :payment_orders_count
      t.integer :refunds_count
      t.string :state
      t.string :pay_state
      t.timestamps
    end

    create_table :trade_orders, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :address, type: :uuid
      t.belongs_to :operator, type: :uuid
      t.belongs_to :from_user, type: :uuid
      t.belongs_to :from_member, type: :uuid
      t.belongs_to :from_member_organ, type: :uuid
      t.belongs_to :from_address, type: :uuid
      t.belongs_to :from_station, type: :uuid
      t.belongs_to :produce_plan, type: :uuid
      t.belongs_to :provide, type: :uuid
      t.belongs_to :current_cart, type: :uuid
      t.belongs_to :payment_strategy, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.belongs_to :desk, type: :uuid
      t.belongs_to :station, type: :uuid
      t.decimal :item_amount
      t.decimal :overall_additional_amount
      t.decimal :overall_reduced_amount
      t.decimal :original_amount, comment: "原价，应用优惠之前的价格"
      t.decimal :amount
      t.decimal :advance_amount
      t.jsonb :extra
      t.integer :lock_version
      t.string :uuid
      t.string :note
      t.datetime :expire_at
      t.integer :serial_number
      t.string :currency
      t.integer :deposit_ratio, comment: "最小预付比例"
      t.integer :items_count
      t.integer :payment_orders_count
      t.datetime :paid_at, index: true
      t.datetime :pay_deadline_at
      t.boolean :pay_auto
      t.decimal :adjust_amount
      t.decimal :received_amount
      t.decimal :refunded_amount
      t.decimal :unreceived_amount
      t.decimal :payable_amount
      t.decimal :verifying_amount, comment: "待核销金额"
      t.string :aim
      t.string :generate_mode
      t.string :state
      t.string :payment_status
      t.timestamps
    end

    create_table :trade_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :member_organ, type: :uuid
      t.belongs_to :address, type: :uuid
      t.belongs_to :operator, type: :uuid
      t.belongs_to :from_station, type: :uuid
      t.belongs_to :from_address, type: :uuid
      t.belongs_to :provide, type: :uuid
      t.belongs_to :good, polymorphic: true, type: :uuid
      t.belongs_to :current_cart, type: :uuid
      t.belongs_to :order, type: :uuid
      t.belongs_to :source, type: :uuid
      t.belongs_to :unit, type: :uuid
      t.belongs_to :scene, type: :uuid
      t.belongs_to :desk, type: :uuid
      t.belongs_to :station, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, type: :uuid
      t.string :uuid
      t.string :good_name
      t.decimal :number, comment: "数量"
      t.decimal :done_number, comment: "已达成交易数量"
      t.virtual :rest_number, type: :decimal, as: "number - done_number", stored: true
      t.integer :weight, comment: "重量"
      t.integer :volume, comment: "体积"
      t.string :vip_code
      t.decimal :single_price, comment: "一份产品的价格"
      t.decimal :additional_amount, comment: "附加服务价格汇总"
      t.decimal :reduced_amount, comment: "已优惠的价格"
      t.decimal :amount, comment: "合计份数之后的价格，商品原价"
      t.jsonb :wallet_amount
      t.decimal :advance_amount, comment: "预付款"
      t.datetime :expire_at
      t.string :note
      t.jsonb :extra
      t.integer :holds_count
      t.integer :purchase_items_count
      t.string :status
      t.string :delivery_status
      t.string :dispatch
      t.string :aim
      t.string :job_id
      t.date :produce_on, comment: "对接生产管理"
      t.integer :purchase_id
      t.string :purchase_status
      t.timestamps
    end

    create_table :notice_notification_sendings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :notification, type: :uuid
      t.string :way
      t.string :sent_to
      t.datetime :sent_at
      t.string :sent_result
      t.timestamps
    end

    create_table :notice_announcement_user_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :announcement, type: :uuid
      t.belongs_to :user_tag, type: :uuid
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_organs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :announcement, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_job_titles, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :announcement, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_departments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :announcement, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcements, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :publisher, polymorphic: true, type: :uuid
      t.string :type
      t.string :title
      t.string :body
      t.string :link
      t.integer :notifications_count
      t.integer :readed_count
      t.timestamps
    end

    create_table :notice_notifications, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :sender, polymorphic: true, type: :uuid
      t.belongs_to :notifiable, polymorphic: true, type: :uuid
      t.belongs_to :linked, polymorphic: true, type: :uuid
      t.string :type
      t.string :state
      t.string :title
      t.string :body
      t.string :link
      t.datetime :sending_at
      t.datetime :read_at, index: true
      t.string :code
      t.boolean :official
      t.boolean :archived
      t.boolean :verbose
      t.datetime :created_at, null: false, index: true
      t.integer :receiver_id, index: true
    end

    create_table :eventual_time_lists, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :code
      t.string :kind
      t.integer :item_minutes
      t.integer :interval_minutes
      t.boolean :default
      t.timestamps
    end

    create_table :eventual_time_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :time_list, type: :uuid
      t.integer :position
      t.time :start_at
      t.time :finish_at
      t.timestamps
    end

    create_table :eventual_seats, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :place, type: :uuid
      t.string :name
      t.integer :min_members
      t.integer :max_members
      t.timestamps
    end

    create_table :eventual_plan_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :time_item, type: :uuid
      t.belongs_to :time_list, type: :uuid
      t.belongs_to :planned, polymorphic: true, type: :uuid
      t.belongs_to :place, type: :uuid
      t.belongs_to :event, type: :uuid
      t.belongs_to :event_item, type: :uuid
      t.date :plan_on
      t.integer :bookings_count
      t.integer :plan_participants_count
      t.string :repeat_index
      t.jsonb :extra
      t.timestamps
    end

    create_table :eventual_plan_attenders, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :plan_participant, type: :uuid
      t.belongs_to :attender, polymorphic: true, type: :uuid
      t.belongs_to :plan_item, type: :uuid
      t.belongs_to :plan, type: :uuid
      t.belongs_to :place, type: :uuid
      t.boolean :attended
      t.string :state
      t.jsonb :extra
      t.timestamps
    end

    create_table :eventual_event_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :eventual_event_participants, id: :uuid, default: "uuidv7()" do |t|
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
    end

    create_table :eventual_event_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :event, type: :uuid
      t.belongs_to :author, type: :uuid
      t.string :name
      t.timestamps
    end

    create_table :eventual_event_grants, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :event, type: :uuid
      t.string :grant_kind
      t.string :grant_column
      t.jsonb :filter
      t.timestamps
    end

    create_table :eventual_event_crowds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :event, type: :uuid
      t.belongs_to :crowd, type: :uuid
      t.integer :present_number
      t.timestamps
    end

    create_table :eventual_events, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :event_taxon, type: :uuid
      t.belongs_to :time_list, type: :uuid
      t.belongs_to :place, type: :uuid
      t.string :name
      t.string :description
      t.integer :position
      t.integer :event_participants_count
      t.integer :event_items_count
      t.integer :members_count
      t.date :begin_on
      t.date :end_on
      t.date :produced_begin_on
      t.date :produced_end_on
      t.boolean :produce_done
      t.string :repeat_type
      t.integer :repeat_count, comment: "每几周/天"
      t.string :repeat_days, array: true
      t.timestamps
    end

    create_table :eventual_crowd_members, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :crowd, type: :uuid
      t.belongs_to :member, polymorphic: true, type: :uuid
      t.belongs_to :agency, type: :uuid
      t.string :state
      t.timestamps
    end

    create_table :eventual_crowds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :member_type
      t.integer :crowd_members_count
      t.timestamps
    end

    create_table :eventual_bookings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :booker, polymorphic: true, type: :uuid
      t.belongs_to :booked, polymorphic: true, type: :uuid
      t.belongs_to :plan_item, type: :uuid
      t.belongs_to :time_item, type: :uuid
      t.belongs_to :place, type: :uuid
      t.belongs_to :seat, type: :uuid
      t.date :booking_on
      t.timestamps
    end

    create_table :eventual_plan_participants, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :planning, polymorphic: true, type: :uuid
      t.belongs_to :event_participant, type: :uuid
      t.belongs_to :participant, polymorphic: true, type: :uuid
      t.string :type
      t.string :status, comment: "默认 event_participant 有效"
      t.timestamps
    end

    create_table :eventual_place_taxon_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "eventual/place_taxon_anc_desc_idx"
    end

    create_table :eventual_place_taxons, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.integer :position
      t.decimal :profit_margin
      t.integer :places_count
      t.timestamps
    end

    create_table :eventual_places, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :area, type: :uuid
      t.belongs_to :place_taxon, type: :uuid
      t.string :name
      t.string :description
      t.string :color
      t.integer :seats_count
      t.integer :plans_count
      t.jsonb :place_taxon_ancestors
      t.timestamps
    end

    create_table :detail_taxon_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :taxon, polymorphic: true, type: :uuid
      t.belongs_to :item, type: :uuid
      t.belongs_to :list, type: :uuid
      t.string :default_value
      t.timestamps
    end

    create_table :detail_post_syncs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :post, type: :uuid
      t.belongs_to :synced, polymorphic: true, type: :uuid
      t.string :source_id
      t.datetime :synced_at
      t.timestamps
    end

    create_table :detail_lists, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :name
      t.string :status
      t.integer :position
      t.integer :items_count
      t.timestamps
    end

    create_table :detail_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :list, type: :uuid
      t.string :name
      t.string :type
      t.string :key
      t.string :description
      t.timestamps
    end

    create_table :detail_entity_items, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :entity, polymorphic: true, type: :uuid
      t.belongs_to :taxon_item, type: :uuid
      t.belongs_to :item, type: :uuid
      t.belongs_to :list, type: :uuid
      t.string :value
      t.timestamps
    end

    create_table :detail_knowledge_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "detail/knowledge_anc_desc_idx"
    end

    create_table :detail_knowledges, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.string :title
      t.text :body
      t.integer :position
      t.jsonb :parent_ancestors
      t.timestamps
    end

    create_table :detail_knowings, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :knowable, polymorphic: true, type: :uuid
      t.belongs_to :knowledge, type: :uuid
      t.boolean :primary
      t.timestamps
    end

    create_table :detail_contents, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :detail, polymorphic: true, type: :uuid
      t.belongs_to :author, type: :uuid
      t.string :type
      t.string :title
      t.text :body
      t.integer :position
      t.string :list
      t.timestamps
    end

    create_table :detail_posts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :thumb_media_id
      t.string :title
      t.string :content
      t.string :link
      t.string :code
      t.timestamps
    end

    create_table :org_tutorials, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :tutor, type: :uuid
      t.string :state
      t.string :accepted_status
      t.string :verified
      t.string :kind
      t.date :start_on
      t.date :finish_on
      t.string :performance
      t.integer :allowance
      t.string :note
      t.string :comment
      t.timestamps
    end

    create_table :org_supports, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :supporter, type: :uuid
      t.string :name
      t.integer :grade
      t.string :code
      t.jsonb :department_ancestors
      t.timestamps
    end

    create_table :org_super_job_titles, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.integer :grade
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :org_shortcuts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.string :controller
      t.string :action
      t.string :business
      t.string :namespace
      t.timestamps
    end

    create_table :org_resign_references, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :resign, type: :uuid
      t.belongs_to :resign_reason, type: :uuid
      t.timestamps
    end

    create_table :org_resign_reasons, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.integer :position
      t.integer :resigns_count
      t.timestamps
    end

    create_table :org_resigns, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.date :leave_on
      t.string :reason_note
      t.string :handover_note
      t.string :comment
      t.string :state
      t.timestamps
    end

    create_table :org_organ_handles, id: :uuid, default: "uuidv7()" do |t|
      t.string :record_class
      t.string :record_column
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :org_member_departments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.jsonb :department_ancestors
      t.integer :department_root_id
      t.integer :superior_id
      t.integer :grade
      t.timestamps
    end

    create_table :org_job_transfers, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :to_department, type: :uuid
      t.belongs_to :to_job_title, type: :uuid
      t.belongs_to :from_department, type: :uuid
      t.belongs_to :from_job_title, type: :uuid
      t.string :state
      t.date :transfer_on
      t.string :reason_note
      t.timestamps
    end

    create_table :org_department_grants, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :organ_handle, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :job_title, type: :uuid
      t.timestamps
    end

    create_table :org_department_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "org/department_anc_desc_idx"
    end

    create_table :org_departments, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :superior, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.integer :needed_number
      t.integer :member_departments_count
      t.integer :all_member_departments_count
      t.jsonb :superior_ancestors
      t.timestamps
    end

    create_table :org_job_titles, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :department, type: :uuid
      t.belongs_to :department_root, type: :uuid
      t.belongs_to :super_job_title, type: :uuid
      t.integer :grade
      t.integer :super_grade
      t.string :name
      t.string :description
      t.integer :limit_member
      t.timestamps
    end

    create_table :org_organ_domains, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :subdomain
      t.string :domain
      t.string :host, index: true
      t.boolean :default
      t.string :beian, comment: "备案号"
      t.string :redirect_controller
      t.string :redirect_action, comment: "默认跳转"
      t.string :scheme
      t.string :kind
      t.timestamps
    end

    create_table :org_organ_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "org/organ_anc_desc_idx"
    end

    create_table :org_organs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :area, type: :uuid
      t.belongs_to :creator, type: :uuid
      t.belongs_to :provider, type: :uuid
      t.belongs_to :parent, type: :uuid
      t.belongs_to :cache, type: :uuid
      t.belongs_to :corp_user, type: :uuid
      t.string :name
      t.string :name_short
      t.string :address
      t.boolean :official, comment: "是否官方"
      t.boolean :joinable, comment: "是否可搜索并加入"
      t.string :code
      t.string :license
      t.string :service_url, comment: "客服 url"
      t.jsonb :theme_settings
      t.integer :members_count
      t.jsonb :area_ancestors
      t.jsonb :parent_ancestors
      t.string :dispatch
      t.boolean :production_enabled
      t.jsonb :factory_settings
      t.integer :limit_wechat
      t.integer :limit_wechat_menu
      t.string :appid
      t.timestamps
    end

    create_table :org_members, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :cache, type: :uuid
      t.belongs_to :member_inviter, type: :uuid
      t.string :identity, index: true
      t.string :experience
      t.string :attendance_number
      t.integer :organ_root_id
      t.string :name
      t.string :number
      t.date :join_on
      t.boolean :enabled
      t.boolean :inviter
      t.boolean :own
      t.string :state
      t.jsonb :department_ancestors
      t.integer :pomodoro
      t.integer :maintains_count
      t.integer :promote_goods_count
      t.string :notifiable_types
      t.jsonb :counters
      t.integer :showtime
      t.boolean :accept_email
      t.string :corp_userid
      t.string :wechat_openid
      t.timestamps
    end

    create_table :crm_texts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :source, type: :uuid
      t.string :note
      t.integer :margin_x
      t.integer :margin_y
      t.string :font
      t.string :align
      t.timestamps
    end

    create_table :crm_tags, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :logged_type
      t.string :entity_column
      t.string :entity_value
      t.string :color
      t.integer :sequence
      t.timestamps
    end

    create_table :crm_source_contacts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :maintain_source, type: :uuid
      t.belongs_to :source, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :trade_item, type: :uuid
      t.timestamps
    end

    create_table :crm_source_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "crm/source_anc_desc_idx"
    end

    create_table :crm_sources, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.string :name
      t.boolean :materialize
      t.integer :fixed_width
      t.jsonb :parent_ancestors
      t.string :sku
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
      t.timestamps
    end

    create_table :crm_qrcodes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :source, type: :uuid
      t.integer :margin_x
      t.integer :margin_y
      t.integer :fixed_width
      t.string :align
      t.timestamps
    end

    create_table :crm_notes, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :member, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :logged, polymorphic: true, type: :uuid
      t.belongs_to :maintain_tag, type: :uuid
      t.string :content
      t.string :tag_str
      t.integer :tag_sequence
      t.jsonb :extra
      t.timestamps
    end

    create_table :crm_maintain_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :tag, type: :uuid
      t.string :name
      t.string :logged_type
      t.string :entity_column
      t.string :entity_value
      t.integer :sequence
      t.boolean :manual
      t.string :color
      t.integer :notes_count
      t.timestamps
    end

    create_table :crm_maintain_sources, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :source, type: :uuid
      t.string :name
      t.integer :maintains_count
      t.timestamps
    end

    create_table :crm_agencies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :agent, polymorphic: true, type: :uuid
      t.belongs_to :client, polymorphic: true, type: :uuid
      t.string :relation
      t.decimal :commission_ratio, comment: "交易时抽成比例"
      t.string :note, comment: "备注"
      t.timestamps
    end

    create_table :crm_client_hierarchies, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :ancestor, type: :uuid
      t.belongs_to :descendant, type: :uuid
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "crm/client_anc_desc_idx"
    end

    create_table :crm_clients, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :parent, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.belongs_to :client_organ, type: :uuid
      t.jsonb :parent_ancestors
      t.string :name
      t.jsonb :settings
      t.integer :wallets_count
      t.integer :cards_count
      t.integer :orders_count
      t.integer :addresses_count
      t.integer :items_count
      t.integer :carts_count
      t.timestamps
    end

    create_table :crm_contacts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :client_member, type: :uuid
      t.belongs_to :client_user, type: :uuid
      t.belongs_to :client, type: :uuid
      t.string :name
      t.string :identity
      t.jsonb :extra
      t.boolean :default
      t.integer :wallets_count
      t.integer :cards_count
      t.integer :orders_count
      t.integer :addresses_count
      t.integer :items_count
      t.integer :carts_count
      t.string :corpid
      t.string :external_userid
      t.string :position
      t.string :avatar_url
      t.string :corp_name
      t.string :corp_full_name
      t.string :external_type
      t.string :unionid, index: true
      t.string :wechat_openid, index: true
      t.timestamps
    end

    create_table :crm_maintains, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :member, type: :uuid
      t.belongs_to :task_template, type: :uuid
      t.belongs_to :client, type: :uuid
      t.belongs_to :contact, type: :uuid
      t.belongs_to :agent, polymorphic: true, type: :uuid
      t.belongs_to :agency, type: :uuid
      t.belongs_to :maintain_source, type: :uuid
      t.belongs_to :upstream, type: :uuid
      t.belongs_to :original, type: :uuid
      t.string :remark
      t.integer :position
      t.string :state
      t.string :type
      t.string :description
      t.string :oper_userid
      t.string :add_way
      t.string :external_userid
      t.string :pending_id, index: true
      t.jsonb :remark_mobiles
      t.timestamps
    end

    create_table :stats, id: :uuid, default: "uuidv7()" do |t|
      t.date :date
      t.integer :subscribed_requests_count
      t.integer :oauth_users_count
      t.integer :users_count
      t.integer :requirements_count
      t.timestamps
    end

    create_table :auth_user_taggeds, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :user_tag, type: :uuid
      t.timestamps
    end

    create_table :auth_user_tags, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :user_tagging, polymorphic: true, type: :uuid
      t.string :name
      t.integer :user_taggeds_count
      t.timestamps
    end

    create_table :auth_apps, id: :uuid, default: "uuidv7()" do |t|
      t.string :appid, index: true
      t.string :key
      t.string :host
      t.timestamps
    end

    create_table :auth_accounts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.string :identity, index: true
      t.boolean :confirmed
      t.string :type
      t.string :source
      t.timestamps
      t.index [:identity, :confirmed]
    end

    create_table :auth_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :cache, type: :uuid
      t.string :name
      t.string :password_digest
      t.string :locale
      t.string :timezone
      t.datetime :last_login_at
      t.string :last_login_ip
      t.boolean :disabled
      t.string :source
      t.string :invited_code
      t.boolean :admin
      t.string :notifiable_types
      t.jsonb :counters
      t.integer :showtime
      t.boolean :accept_email
      t.integer :promote_goods_count
      t.integer :pomodoro
      t.timestamps
    end

    create_table :auth_verify_tokens, id: :uuid, default: "uuidv7()" do |t|
      t.string :type
      t.string :token
      t.datetime :expire_at
      t.string :identity, index: true
      t.integer :access_counter
      t.string :uuid
      t.timestamps
    end

    create_table :auth_authorized_tokens, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :member, type: :uuid
      t.string :identity, index: true
      t.datetime :expire_at
      t.integer :access_counter
      t.boolean :mock_user
      t.string :business
      t.string :uid
      t.string :session_id
      t.datetime :online_at
      t.datetime :offline_at
      t.string :encrypted_token
      t.string :auth_appid
      t.string :suite_id
      t.string :corp_userid
      t.string :appid
      t.boolean :mock_member
      t.timestamps
    end

    create_table :auth_oauth_users, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :organ, type: :uuid
      t.string :provider
      t.string :session_key
      t.string :remark
      t.string :name
      t.string :avatar_url
      t.string :appid
      t.string :app_name
      t.string :scene_tag
      t.string :uid
      t.string :unionid, index: true
      t.string :access_token
      t.datetime :expires_at
      t.string :refresh_token
      t.boolean :agency_oauth
      t.datetime :unsubscribe_at
      t.string :scope
      t.string :type
      t.string :state
      t.jsonb :extra
      t.string :identity, index: true
      t.datetime :online_at
      t.datetime :offline_at
      t.timestamps
      t.index [:uid, :type], unique: true
    end
  end

end
