json.last_rent_history do
  json.rented_umbrella @rent_history.umbrella_id
  json.start do
    json.location do
      json.id @rent_history.start_location.id
      json.name @rent_history.start_location.name
      json.mrt_line do
        json.array!(@rent_history.start_location.mrt_lines) do |ml|
          json.id ml.id
          json.line_code ml.line_code
          json.line_name ml.line_name
        end
      end
    end
    json.at_time @rent_history.start_time
  end
  if @rent_history.end_location.present?
    json.end do
      json.location do
        json.id @rent_history.end_location.id
        json.name @rent_history.end_location.name
        json.mrt_line do
          json.array!(@rent_history.end_location.mrt_lines) do |ml|
            json.id ml.id
            json.line_code ml.line_code
            json.line_name ml.line_name
          end
        end
      end
      json.at_time @rent_history.end_time
    end
    json.rent_duration_in_hr @rent_history.duration.round(2).to_s
    json.renting_status "not_in_renting"
  else
    json.renting_status "in_renting"
  end
  json.charged_amount @rent_history.amount
end