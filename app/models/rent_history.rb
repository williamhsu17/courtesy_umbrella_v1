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
    if duration <= 0.01
      self.amount = 10
    elsif duration <= 0.05
      self.amount = 20
    elsif duration <= 0.1
      self.amount = 30
    elsif duration <= 0.5
      self.amount = 40
    elsif duration <= 1
      self.amount = 50
    elsif duration <= 8
      self.amount = 60
    elsif duration <= 12
      self.amount = 70
    else
      self.amount = 90
    end
  end

end
