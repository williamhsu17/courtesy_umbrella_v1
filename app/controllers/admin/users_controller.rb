class Admin::UsersController < ApplicationController
  layout 'admin'
  
  def index
    if params[:keyword]
      @users = User.where( [ "id like ? or email like?", "%#{params[:keyword]}%", "%#{params[:keyword]}%"] )
    else 
      @users = User.all
    end
    @users = @users.page(params[:page]).per(10)
    # @users = User.joins(:rent_histories).merge(RentHistory.order(start_time: :desc))
    # @users = @users.page(params[:page]).per(10)

    # @rent_history = RentHistory.all.order('start_time DESC')
    # @rent_history = @rent_history.page(params[:page]).per(10)
  end

  def show
    @users = User.all.page(params[:page]).per(10)
    # @users = User.joins(:rent_histories).merge(RentHistory.order(start_time: :desc))
    # @users = @users.page(params[:page]).per(10)
    @user = User.find(params[:id])

    @user_last_rent_data = RentHistory.all.where(:user_id => @user.id).last
    @user_umbrella_usage_amount = RentHistory.all.where(:user_id => @user.id).size
    if @user_last_rent_data == nil
      @last_rent_start_time = "-"
      @last_rent_start_location = "-"
      @last_rent_end_time = "-"
      @last_rent_end_location = "-"
      @last_rent_umbrella_id = "-"
    else
      @user_last_rent_data = RentHistory.all.where(:user_id => @user.id).last
      @last_rent_start_time = @user_last_rent_data.start_time.strftime("%Y-%m-%d %H:%M:%S")
      start_station_id = @user_last_rent_data.start_location_id
      @last_rent_start_location = Location.find_by_id(start_station_id).name
      if @user_last_rent_data.end_time == nil 
        @last_rent_end_time = "-"
        @last_rent_end_location = "-"
        @last_rent_umbrella_id = @user_last_rent_data.umbrella_id
      else
        @last_rent_end_time = @user_last_rent_data.end_time.strftime("%Y-%m-%d %H:%M:%S")
        end_station_id = @user_last_rent_data.end_location_id
        @last_rent_end_location = Location.find_by_id(end_station_id).name
        @last_rent_umbrella_id = @user_last_rent_data.umbrella_id
      end
    end

    respond_to do |format|
      format.html
    end
  end
end
