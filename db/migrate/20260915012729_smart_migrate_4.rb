class SmartMigrate4 < ActiveRecord::Migration[8.2]

  def change

    add_belongs_to :wechat_payee_domains, :domain_organ, type: :uuid


    add_column :space_desks, :people, :integer


    add_column :factory_productions, :hot, :boolean, comment: "推荐"


    add_column :trade_order_counter_caches, :agent_id, :uuid
    add_index :trade_order_counter_caches, :agent_id


    add_column :org_organs, :partnership, :boolean
    add_column :org_organs, :provider_token, :string


    add_column :auth_apps, :note, :string


    create_table :auth_app_views, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :app, type: :uuid
      t.string :session_id
      t.datetime :view_at
      t.boolean :starred
      t.timestamps
    end unless table_exists? :auth_app_views    

    add_belongs_to :auth_sessions, :from_organ, type: :uuid

  end

end
