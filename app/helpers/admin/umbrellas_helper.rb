module Admin::UmbrellasHelper
  def umbrella_status(umbrella)
    if umbrella.rent_count > 10
      return "bad"
    else
      return "good"
    end
  end

  def who_owns_it_now(umbrella)
    if umbrella.umbrella_holder_type == "Location"
      return umbrella.umbrella_holder.try(:name)
    else
      return "租借中"
    end
  end
end

def Umbrella_last_rent_time(umbrella)
    last_time_rent_data = RentHistory.where(:umbrella_id => umbrella.id).last
    if last_time_rent_data == nil
      return "-"
    else
      return last_time_rent_data.created_at.strftime("%Y-%m-%d %H:%M:%S")
    end
end
