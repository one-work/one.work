class ChangeMarkdownDoc < ActiveRecord::Migration[8.2]
  def change
    remove_column :markdown_post_documents, :content

    add_column :markdown_post_documents, :markdown, :text
    add_column :markdown_post_documents, :markdown_vector, :tsvector
    add_index :markdown_post_documents, :markdown_vector, using: :gin
  end
end
