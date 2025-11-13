class SmartMigration47 < ActiveRecord::Migration[8.2]

  def change
    add_column :markdown_github_apps, :state, :string
  end

end
