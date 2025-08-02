module Org
  class OrganDomain < ApplicationRecord
    include Model::OrganDomain
    include Wechat::Ext::OrganDomain
  end
end
