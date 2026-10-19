# frozen_string_literal: true

ActiveSearch.define_index(:markdown_posts) do
  text :title
  text :markdown
end
