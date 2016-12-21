class UmbrellasController < ApplicationController
  before_action :authenticate_user!

  def index
    @umbrella = current_user.umbrella
    @my_umb_log = current_user.rent_histories.order("id DESC")
  end

  def borrow
    umbrella = Umbrella.find(params[:umbrella_number])

    umb_log = umbrella.rent_histories.new
    umb_log.start_location = umbrella.umbrella_holder
    umb_log.start_time = Time.now()

    umbrella.umbrella_holder = current_user
    umb_log.user = umbrella.umbrella_holder

    if umbrella.save
      umb_log.save
    else
      puts "unable to change umbrella holder"
    end

    redirect_to umbrellas_path
  end
end
