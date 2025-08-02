class Requirement < ApplicationRecord

  def mobile_public
    "#{'*' * 7 }#{mobile[-4..-1]}"
  end

end
