class UmbrellasController < ApplicationController
  before_action :authenticate_user!

  def index
    @umbrella = current_user.umbrella
    @my_umb_log = current_user.rent_histories.includes(:start_location, :end_location).order("id DESC")
  end

  def borrow
    umbrella = Umbrella.find(params[:umbrella_number])

    status = current_user.borrow(umbrella)

    if status == :success
      redirect_to umbrellas_path
    elsif status == :failed
      # TODO
    elsif status == :error
      puts "unable to change umbrella holder"
    end
  end
end
