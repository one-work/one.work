module Detail
  class Post < ApplicationRecord
    include Wechat::Model::Post
    include Model::Post
    #include RailsQuip::Post

    has_many_attached :pictures

  end
end
