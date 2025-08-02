module Trade
  class Item < ApplicationRecord
    include Model::Item
    include Job::Ext::Jobbed
    include Ship::Ext::Item
    include Bench::Ext::Item
    include Factory::Ext::ItemGood
    include Factory::Ext::ItemPurchase
    include Space::Ext::Item
    include Crm::Ext::Maintainable

  end
end
