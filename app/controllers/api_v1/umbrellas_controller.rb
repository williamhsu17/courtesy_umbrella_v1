class ApiV1::UmbrellasController < ApiController
  # before_action :authenticate_user!, :except => [:index, :list]
  # before_action :authenticate_user!
  # skip_before_filter :verify_authenticity_token

  def index
    @umbrella = Umbrella.all

    render :json => @umbrella, :except => [:created_at, :updated_at]
  end

  def show
    if current_user
      umbrella = current_user.umbrella
      render :json => umbrella, :except => [:created_at, :updated_at], :status => 200
    else
      render :json => { :errors => "you are not login" }
    end
  end

  def list
    umbrella_rent_log = UmbrellaRentHistory.all

    station_time_log = {}

    umbrella_rent_log.each do |u|
      station_time_log[u.start_time] = {:out => u.start_location_id}
      station_time_log[u.end_time] = {:in => u.end_location_id}
    end

    # station_time_log = station_time_log.sort_by { |key, value| key }

    render :json => station_time_log
  end

  def borrow
    if current_user
      umbrella = Umbrella.find(params[:umbrella_number])

      umb_log = umbrella.rent_histories.new
      umb_log.start_location = umbrella.umbrella_holder
      umb_log.start_time = Time.now()

      umbrella.umbrella_holder = current_user
      umb_log.user = umbrella.umbrella_holder

      if umbrella.save
        umb_log.save
        render :json => { :success => "all is well" }, :status => 200
      else
        render :json => { :errors => umbrella.errors.full_messages }
      end
    else
      render :json => { :errors => "you are not login" }
    end
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
      render :json => { :success => "umbrella returned" }, :status => 200
    else
      render :json => { :errors => umbrella.errors.full_messages }
    end
  end
end
