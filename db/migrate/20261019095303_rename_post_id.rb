class RenamePostId < ActiveRecord::Migration[8.2]
  def change
    rename_column :markdown_post_documents, :markdown_post_id, :post_id
  end
end
