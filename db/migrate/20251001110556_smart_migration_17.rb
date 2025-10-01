class SmartMigration17 < ActiveRecord::Migration[8.1]

  def change
    add_column :wechat_apps, :service_url, :string
    add_column :wechat_apps, :service_corp, :string
  end

end
