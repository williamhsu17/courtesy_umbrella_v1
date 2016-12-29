class ApiV1::StationsController < ApiController
  before_action :authenticate_user!, :except => [:index, :list]

  def index
    @locations = Location.includes(:umbrellas , :mrt_lines).all
    # render :json => @locations
  end

  def show
    @location = Location.find(params[:id])
    render :json => @location
  end
end
