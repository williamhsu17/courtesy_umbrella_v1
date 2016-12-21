class Location < ApplicationRecord
  has_many :umbrellas, :as => :umbrella_holder
end
