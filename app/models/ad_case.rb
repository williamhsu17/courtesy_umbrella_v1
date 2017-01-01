class AdCase < ApplicationRecord
  belongs_to :enterprise

  has_many :ad_case_umbrellaships
  has_many :umbrellas, :through => :ad_case_umbrellaships, :source => "umbrella"
end
