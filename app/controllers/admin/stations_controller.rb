class Admin::StationsController < ApplicationController
  layout "admin"
  
  def index
    @stations = Location.includes(:umbrellas , :mrt_lines).all
    if params[:line_number]
    @stations = @stations.where( :mrt_lines => { :line_code =>  params[:line_number] } )
    end
    @stations = @stations.sort {|x,y| x.umbrellas.count <=> y.umbrellas.count }

  end
  def show
    @station = Location.find(params[:id])
    @umbrellas = @station.umbrellas
    @umbrellas_in_this_station = @station.umbrellas
    #Umbrella.where(:umbrella_holder_type => :Location, :umbrella_holder_id => params[:id])
  end

  def return
    umbrella = Umbrella.find(params[:umbrella_number])
    current_location = Location.find(params[:location_id])

    status = current_location.collect(umbrella)

    if status == :success
      redirect_to admin_station_path(params[:location_id])
    else
    end

  end
end
