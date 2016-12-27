# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
Umbrella.destroy_all

Location.create!( :name => "儲存點")

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'taipei-mrt.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  l = Location.new
  l.name = row['name']
  l.station_number1 = row['station_number1']
  l.station_number2 = row['station_number2']
  l.longitude = row['longitude']
  l.latitude = row['latitude']
  l.save
end

puts "There are now #{Location.count} rows in the locations table"

Location.all.each do |location|
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", :umbrella_holder_id => location.id)
  end
end