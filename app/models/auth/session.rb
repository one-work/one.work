module Auth
  class Session < ApplicationRecord
    include Model::Session
    include Wechat::Ext::Session
    include Org::Ext::Session
  end
end
