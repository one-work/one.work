module Eventual
  class Place < ApplicationRecord
    include Model::Place
    include Detail::Ext::Listing
  end
end
