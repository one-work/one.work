class RemoveContentDform < ActiveRecord::Migration[8.2]
  def change
    remove_column :markdown_post_documents, :content_vector
  end
end
