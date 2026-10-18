class CreateMarkdownPostDocuments < ActiveRecord::Migration[8.2]
  def change
    create_table :markdown_post_documents do |t|
      t.uuid :markdown_post_id, null: false
      t.text :title
      t.text :content
    end
    add_index :markdown_post_documents, :markdown_post_id, unique: true

    add_column :markdown_post_documents, :title_vector, :tsvector
    add_index :markdown_post_documents, :title_vector, using: :gin
    add_column :markdown_post_documents, :content_vector, :tsvector
    add_index :markdown_post_documents, :content_vector, using: :gin
  end
end
