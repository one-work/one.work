class SmartMigration49 < ActiveRecord::Migration[8.2]

  def change
    add_belongs_to :markdown_github_apps, :organ, type: :uuid
  end

end
