json.user_rent_history @rent_histories do |h|
  json.rented_umbrella h.umbrella_id
  json.start do
    json.location do
      json.id h.start_location.id
      json.name h.start_location.name
      json.mrt_line do
        json.array!(h.start_location.mrt_lines) do |ml|
          json.id ml.id
          json.line_code ml.line_code
          json.line_name ml.line_name
        end
      end
    end
    json.at_time h.start_time
  end
  if h.end_location.present?
    json.end do
      json.location do
        json.id h.end_location.id
        json.name h.end_location.name
        json.mrt_line do
          json.array!(h.end_location.mrt_lines) do |ml|
            json.id ml.id
            json.line_code ml.line_code
            json.line_name ml.line_name
          end
        end
      end
      json.at_time h.end_time
    end
    json.rent_duration_in_hr h.duration.round(2).to_s
    json.renting_status "not_in_renting"
  else
    json.renting_status "in_renting"
  end
  json.charged_amount h.amount
end