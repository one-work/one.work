module Org
  class Organ < ApplicationRecord
    include Model::Organ
    include Com::Ext::Taxon
    include Trade::Ext::Organ
    include Roled::Ext::Organ
    include Factory::Ext::Organ
    include Wechat::Ext::Organ
    include Print::Ext::Organ

    #after_create_commit :init_provider_later

    def init_provider_later
      AutoProviderJob.perform_later(self)
    end

  end
end
