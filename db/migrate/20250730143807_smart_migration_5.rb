class SmartMigration5 < ActiveRecord::Migration[8.0]

  def change
    add_column :auth_sessions, :ip_address, :string
    add_column :auth_sessions, :user_agent, :string
    rename_column :auth_sessions, :expire_at, :expires_at
    rename_column :auth_verify_tokens, :expire_at, :expires_at
  end

end
