json.all_locations @locations do |l|
  json.location_id l.id
  json.location_name l.name

  json.rentable_umbrella_number l.umbrellas.size
end