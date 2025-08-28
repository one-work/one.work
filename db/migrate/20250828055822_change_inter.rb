class ChangeInter < ActiveRecord::Migration[8.0]
  def change
    change_column :wechat_platform_templates, :audit_status, :integer, using: 'audit_status::integer'
  end
end
