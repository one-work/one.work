class SmartMigration15 < ActiveRecord::Migration[8.1]

  def change

    add_column :wechat_registers, :bank_number, :string

    add_column :org_organs, :counters, :jsonb
  end

end
