class SmartRemoveTable2 < ActiveRecord::Migration[8.1]

  def change
    drop_table :auth_accounts
    drop_table :wechat_app_configs
  end

end
