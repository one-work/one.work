class ChangeDefaultToOganCount < ActiveRecord::Migration[8.1]
  def change
    change_column_default :org_organs, :counters, {}
  end
end
