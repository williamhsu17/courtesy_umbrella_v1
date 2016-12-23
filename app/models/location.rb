class Location < ApplicationRecord
  has_many :umbrellas, :as => :umbrella_holder

  def collect(umbrella)

    umbrella.umbrella_holder = self
    umbrella_log = umbrella.rent_histories.last
    umbrella_log.end_location = self
    umbrella_log.end_time = Time.now

    if umbrella.save
      umbrella_log.save!
      return :success
    else
      return :failed
    end

  end

end
