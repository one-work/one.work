class SmartMigrate3 < ActiveRecord::Migration[8.2]

  def change

    add_column :roled_caches, :roles_arr, :jsonb
    remove_column :roled_caches, :str_roles, :string


    add_column :roled_roles, :with_mock_id, :string


    add_belongs_to :wechat_payee_domains, :organ, type: :uuid


    remove_column :notice_notifications, :verbose, :boolean


    add_belongs_to :auth_apps, :creator, type: :uuid
    add_column :auth_apps, :name, :string

  end

end
