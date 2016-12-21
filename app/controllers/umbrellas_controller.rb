class UmbrellasController < ApplicationController
  before_action :authenticate_user!

  def index
    @umbrella = current_user.umbrella
    @my_umb_log = current_user.rent_histories.order("id DESC")
  end
end
