module Org
  class Member < ApplicationRecord
    include Model::Member
    include Bench::Ext::Member
    include Crm::Ext::Member
    include Roled::Ext::Member
    include Trade::Ext::Member
    include Finance::Ext::Member
    include Notice::Ext::Member
    include Notice::Ext::Setting
    include Attend::Ext::Member
    include Wechat::Ext::Member
  end
end
