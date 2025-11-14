class SmartMigration48 < ActiveRecord::Migration[8.2]

  def change
    add_belongs_to :markdown_gits, :github_user, type: :uuid
    remove_column :markdown_gits, :identity, :string
  end

end
