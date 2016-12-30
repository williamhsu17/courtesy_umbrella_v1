class ApiV1::UserController < ApiController
  before_action :authenticate_user!

  def current_status
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
  end

  def show
    @rent_histories = RentHistory.all
    render :json => @rent_histories
  end
end
