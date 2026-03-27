class Requirement < ApplicationRecord
  attribute :xx, :string
  attribute :yy, :string, index: true

  def mobile_public
    "#{'*' * 7 }#{mobile[-4..-1]}"
  end

end
