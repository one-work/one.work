class SmartMigration51 < ActiveRecord::Migration[8.2]

  def change
    add_column :markdown_catalogs, :published, :boolean
  end

end
