class LocationMrtLineship < ApplicationRecord
  belongs_to :location
  belongs_to :mrt_line
end
