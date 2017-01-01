class Admin::StationsController < ApplicationController
  layout "admin", :except => [:list, :show]

  def index
    @stations = Location.includes(:umbrellas , :mrt_lines)
    if params[:line_number]
      @stations = @stations.where( :mrt_lines => { :line_code =>  params[:line_number] } )
    end
    @stations = @stations.sort {|x,y| x.umbrellas.count <=> y.umbrellas.count }
    @stations_with_paginate = Kaminari.paginate_array( @stations ).page(params[:page]).per(15)

    #ratio of stations where umbrella number less 10
    x = 0
    @stations.each {|s| s.umbrellas.size < 10 ?  x += 1 : x = x}
    # @stations.each do |station|
    #   if station.umbrellas.size < 10
    #     x += 1
    #   else
    #     x = x
    #   end
    # end
    @stations_need_umbrellas_count = x
    y = @stations.size
    @stations_need_umbrellas_ratio = (100*x/y).to_i

    # @stations_need_umbrellas = @stations.where({ 'umbrellas.size < ?' , 10 })

    #bad umbrellas percentage
    b = 0
    @stations.each do |s|
      s.umbrellas.each {|u| u.rent_count > 10 ? b += 1 : b = b }
      # s.umbrellas.each do |u|
      #   if u.rent_count > 10
      #     b += 1
      #   else
      #     b = b
      #   end
      # end
    end
    @bad_umbrellas_count = b

    t = 0
    @stations.each do |s|
      t += s.umbrellas.count
    end
    @total_umbrellas_on_mrt_lines = t
    @good_umbrellas_count = t - b
    @bad_umbrellas_percentage = (100 * b/t).to_i
    # @bad_umbrellas_count = Umbrella.includes(:locations).where('rent_count > ?', 10)
    # a = @bad_umbrellas.count
    # @good_umbrellas_count = Umbrella.includes(:locations).where('rent_count <= ?', 10)
    # b = @good_umbrellas.count
    # t = a + b
    # @bad_umbrellas_percentage = (100 * a/t).to_i
  end

  def list

  end

  def show
    @station = Location.find(params[:id])
    @umbrellas = @station.umbrellas
    @umbrellas_in_this_station = @station.umbrellas
    # Umbrella.where(:umbrella_holder_type => :Location, :umbrella_holder_id => params[:id])
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
