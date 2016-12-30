json.chosen_location do
  json.location_id @location.id
  json.location_name @location.name
  json.location_coordinate do
    json.longitude (@location.longitude.to_f/10000000).to_s
    json.latitude (@location.latitude.to_f/10000000).to_s
  end
  json.mrt_line do
    json.array!(@location.mrt_lines) do |ml|
      json.id ml.id
      json.line_code ml.line_code
      json.line_name ml.line_name
    end
  end
  json.rentable_umbrella_number @location.umbrellas.size
end