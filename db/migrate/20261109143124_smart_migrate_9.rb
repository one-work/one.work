class SmartMigrate9 < ActiveRecord::Migration[8.2]

  def change

    add_column :trade_holds, :number, :decimal
    add_column :trade_holds, :produce_on, :date
    add_column :trade_holds, :status, :string


    create_table :print_printer_logs, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :printer, type: :uuid
      t.string :note
      t.timestamps
    end unless table_exists? :print_printer_logs    

    add_column :print_template_table_items, :prefix, :string
    add_column :print_template_table_items, :suffix, :string
    add_column :print_template_table_items, :input, :string


    create_table :wechat_channels, id: :uuid, default: "uuidv7()" do |t|
      t.string :feed_id
      t.string :finder_user_name
      t.string :feed_token
      t.boolean :autoplay
      t.boolean :looped
      t.string :appid
      t.timestamps
    end unless table_exists? :wechat_channels    
  end

end
