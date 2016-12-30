class ApiV1::StationsController < ApiController
  before_action :authenticate_user!, :except => [:index, :list]

  def index
    @locations = Location.includes(:umbrellas , :mrt_lines).all
    render "index.json.jbuilder", :status => 200
  end

  def show
    @location = Location.find(params[:id])
    render "show.json.jbuilder", :status => 200
  end
end
