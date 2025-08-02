class RenameAuthorizedToSessions < ActiveRecord::Migration[8.0]
  def change
    rename_table :auth_authorized_tokens, :auth_sessions
  end
end
