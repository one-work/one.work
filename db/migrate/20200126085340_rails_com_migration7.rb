class RailsComMigration7 < ActiveRecord::Migration[6.0]

  def change



















































    remove_column :tickets, :match_value, :string

    add_column :wechat_responses, :contain, :boolean, default: true

























































































































  end

end