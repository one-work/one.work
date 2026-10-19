# frozen_string_literal: true

ActiveSearch.define_index(
  :markdown_posts,
  source: 'Markdown::Post',
  document_class: 'Markdown::PostDocument'
) do
  text :title
  text :markdown
end
