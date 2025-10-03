class RemoveOauthUserIndexInUid < ActiveRecord::Migration[8.1]
  def change
    remove_index :auth_oauth_users, name: 'index_auth_oauth_users_on_uid_and_type'
  end
end
