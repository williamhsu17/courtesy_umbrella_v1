class Admin::UmbrellasController < ApplicationController
  layout 'admin'

  def index
    # @locations = Location.all
    @umbrellas = Umbrella.all.order('id DESC')
    # @umbrellas = @umbrellas.includes(:umbrella_holder).order('id DESC')
    if params[:line_number]
      @umbrellas = @umbrellas.in_stations 
      # @umbrellas = @umbrellas.where( :mrt_lines => { :line_code =>  params[:line_number] } )
      @mrtline_number = MrtLine.where(:line_code => params[:line_number]).first.locations.pluck(:id)
      @umbrellas = @umbrellas.in_stations.where(:umbrella_holder_id => @mrtline_number)
    elsif params[:in_rent]
      @umbrellas = @umbrellas.in_users
    end

    if params[:keyword]
      @umbrellas = Umbrella.where( [ "id like ? or rent_count like? ", "%#{params[:keyword]}%", "%#{params[:keyword]}%"] )
    else 
      @umbrellas = @umbrellas
    end

    @umbrellas = @umbrellas.page(params[:page]).per(15)    



    # @umbrellas_in_renting = Umbrella.in_users
    # @umbrellas_in_station = Umbrella.in_stations

    # umbrella_rent_log = RentHistory.all

    # station_time_log = {}

    # umbrella_rent_log.each do |u|
    #   if u.start_location_id == 1
    #     station_time_log[u.start_time] = {:in => u.start_location_id}
    #   end
    #   if u.end_location_id == 1
    #     station_time_log[u.end_time] = {:out => u.end_location_id}
    #   end
    # end

    # @station_time_log = station_time_log.sort_by { |key, value| key }
  end

  def show
    umbrella = Umbrella.find(params[:id])
    @umb_log = umbrella.rent_histories.order("id DESC")
  end
end
