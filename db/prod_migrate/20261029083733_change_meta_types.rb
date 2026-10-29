class ChangeMetaTypes < ActiveRecord::Migration[8.2]
  def change
    change_column :meta_actions, :required_parts, :jsonb, using: 'to_jsonb(required_parts)'
  end
end
