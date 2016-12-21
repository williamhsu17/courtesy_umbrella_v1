class Admin::StationsController < ApplicationController
  def show
    @station = Location.find(params[:id])
    @umbrellas = @station.umbrellas
    @umbrellas_in_this_station = Umbrella.where(:umbrella_holder_type => :Location, :umbrella_holder_id => params[:id])
  end

  def return
    umbrella = Umbrella.find(params[:umbrella_number])
    current_location = Location.find(params[:location_id])
    umbrella.umbrella_holder = current_location

    umb_log = umbrella.rent_histories.last
    umb_log.end_location = umbrella.umbrella_holder
    umb_log.end_time = Time.now()

    if umbrella.save
      umb_log.save
    else
    end

    redirect_to admin_station_path(params[:location_id])
  end
end
