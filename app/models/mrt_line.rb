class MrtLine < ApplicationRecord
  has_many :location_mrt_lineships
  has_many :locations, :through => :location_mrt_lineships, :source => "location"
end
