class RentHistory < ApplicationRecord
  belongs_to :umbrella
  belongs_to :user

  belongs_to :start_location, :class_name => "Location"
  belongs_to :end_location, :class_name => "Location", :optional => true
end
