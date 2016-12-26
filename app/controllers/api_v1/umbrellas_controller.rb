class ApiV1::UmbrellasController < ApiController

  before_action :authenticate_user!, :except => [:index, :list]

  # before_action :authenticate_user!
  # skip_before_filter :verify_authenticity_token

  def index
    @umbrella = Umbrella.all

    column_to_render = params[:field].try(:split, ",") || Umbrella.column_names
    render :json => @umbrella, :only => column_to_render
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
    umbrella_rent_log = RentHistory.all

    station_time_log = {}

    umbrella_rent_log.each do |u|
      station_time_log[u.start_time] = {:out => u.start_location_id}
      station_time_log[u.end_time] = {:in => u.end_location_id}
    end

    # station_time_log = station_time_log.sort_by { |key, value| key }

    render :json => station_time_log
  end

  def borrow
    if params[:umbrella_number].present?
      umbrella = Umbrella.find(params[:umbrella_number])
    else
      if current_user.umbrella
        render :json => { :borrow_status => 0,
                          :dev_message => "This user has already borrow an umbrella",
                          :user_message => "抱歉，您已經借出一隻雨傘了" } and return
      else
        render :json => { :borrow_status => 1,
                          :dev_message => "This user can borrow an umbrella",
                          :user_message => "您目前可以借傘"} and return
      end
    end
    status = current_user.borrow(umbrella)

    if status == :success
      render :json => { :success => "借傘成功" }, :status => 200
    else
      render :json => { :errors => umbrella.errors.full_messages }, :status => 403
    end
  end

  def return
    umbrella = Umbrella.find(params[:umbrella_number])
    current_location = Location.find(params[:location_id])

    status = current_location.collect(umbrella)

    if status == :success
      render :json => { :success => "還傘成功" }, :status => 200
    else
      render :json => { :errors => umbrella.errors.full_messages }, :status => 400
    end
  end
end
