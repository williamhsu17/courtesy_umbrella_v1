class RentHistory < ApplicationRecord
  belongs_to :umbrella
  belongs_to :user

  belongs_to :start_location, :class_name => "Location"
  belongs_to :end_location, :class_name => "Location", :optional => true

  validates :umbrella_id, :presence => true
  validates :user_id, :presence => true
  validates :start_location_id, :presence => true
  validates :start_time, :presence => true

  validates :end_location_id, :presence => true, :if => :is_returned?
  validates :end_time, :presence => true, :if => :is_returned?

  def is_returned?
    is_returned
  end

  def duration
    duration = ((self.end_time - self.start_time) / 3600)
  end

  def amount_to_charge
    duration = self.duration
    if duration <= 8
      self.amount = 10
    elsif duration <= 24
      self.amount = 20
    else
      self.amount = 30
    end
  end

end
