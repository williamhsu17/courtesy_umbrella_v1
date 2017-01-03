module Admin::RentHistoriesHelper
  def start_station_name(rent)
    start_station_id = rent.start_location_id
    return Location.find_by_id(start_station_id).name
  end

  def end_station_name(rent)
    end_station_id = rent.end_location_id
    return Location.find_by_id(end_station_id).name
  end
end
