module Crm
  class Maintain < ApplicationRecord
    include Model::Maintain
    include Wechat::Ext::Maintain
    include Eventual::Ext::Planned if defined? RailsEvent
  end
end
