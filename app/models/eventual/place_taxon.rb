module Eventual
  class PlaceTaxon < ApplicationRecord
    include Com::Ext::Taxon
    include Model::PlaceTaxon
    include Detail::Ext::TaxonModel
  end
end
