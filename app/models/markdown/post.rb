module Markdown
  class Post < ApplicationRecord
    include Model::Post
    has_search
  end
end
