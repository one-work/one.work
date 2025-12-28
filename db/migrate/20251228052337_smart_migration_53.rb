class SmartMigration53 < ActiveRecord::Migration[8.2]

  def change
    create_table :cms_posts, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.belongs_to :catalog, type: :uuid
      t.string :title
      t.timestamps
    end unless table_exists? :cms_posts

    create_table :cms_catalogs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :organ, type: :uuid
      t.string :title
      t.timestamps
    end unless table_exists? :cms_catalogs


    add_column :wechat_scenes, :broadcast_to, :string

    add_column :wechat_apps, :webview_path, :string

    add_column :trade_payments, :print_info, :jsonb

    add_column :trade_orders, :print_info, :jsonb

  end

end
