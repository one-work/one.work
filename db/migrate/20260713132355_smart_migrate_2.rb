class SmartMigrate2 < ActiveRecord::Migration[8.2]

  def change

    add_column :roled_role_whos, :mock, :boolean


    add_column :roled_caches, :str_roles, :string
    add_column :roled_caches, :mock, :boolean


    remove_column :roled_roles, :default, :boolean


    add_belongs_to :org_organs, :mock_cache, type: :uuid
    add_column :org_organs, :address_short, :string


    add_belongs_to :org_members, :mock_cache, type: :uuid
    remove_column :org_members, :wechat_openid, :string


    add_belongs_to :auth_users, :mock_cache, type: :uuid

  end

end
