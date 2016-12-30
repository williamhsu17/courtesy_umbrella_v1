class Location < ApplicationRecord
  has_many :umbrellas, :as => :umbrella_holder

  has_many :location_mrt_lineships
  has_many :mrt_lines, :through => :location_mrt_lineships, :source => "mrt_line"

  def collect(umbrella)

    umbrella.umbrella_holder = self
    umbrella_log = umbrella.rent_histories.last
    umbrella_log.end_location = self
    umbrella_log.end_time = Time.now
    umbrella_log.amount_to_charge

    if umbrella.save
      umbrella_log.save!
      return :success
    else
      return :failed
    end

  end

end
