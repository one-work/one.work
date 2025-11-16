class SmartMigration52 < ActiveRecord::Migration[8.2]

  def change
    add_column :markdown_posts, :position, :integer
  end

end
