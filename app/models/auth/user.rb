module Auth
  class User < ApplicationRecord
    include Model::User
    include Roled::Ext::User
    include Notice::Ext::User
    include Notice::Ext::Setting
    include Trade::Ext::User
    include Org::Ext::User
    include Wechat::Ext::User
    include Bench::Ext::User
    include Ship::Ext::User

    has_one :wechat_user

  end
end
