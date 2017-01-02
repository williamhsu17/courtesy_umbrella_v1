module Admin::UsersHelper
  def user_last_rent_time(user)
    last_rent_history = RentHistory.all.where(:user_id => user.id).last
    if last_rent_history == nil
      return "-"
    else 
      return last_rent_history.start_time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end

