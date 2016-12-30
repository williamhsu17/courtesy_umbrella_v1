json.all_locations @locations do |l|
  json.location_id l.id
  json.location_name l.name
  json.location_coordinate do
    json.longitude (l.longitude.to_f/10000000).to_s
    json.latitude (l.latitude.to_f/10000000).to_s
  end
  json.mrt_line do
    json.array!(l.mrt_lines) do |ml|
      json.id ml.id
      json.line_code ml.line_code
      json.line_name ml.line_name
    end
  end
  json.rentable_umbrella_number l.umbrellas.size
end