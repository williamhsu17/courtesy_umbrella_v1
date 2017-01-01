# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
Umbrella.destroy_all
MrtLine.destroy_all
LocationMrtLineship.destroy_all


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'taipei-mrt-stations.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  l = Location.new
  l.name = row['name']
  l.station_number1 = row['station_number1']
  l.station_number2 = row['station_number2']
  l.longitude = row['longitude7']
  l.latitude = row['latitude7']
  l.save
end

Location.create!( :name => "雨傘倉庫")


puts "There are now #{Location.count} rows in the locations table"

MrtLine.create!( :line_code => "1" , :line_name => "文湖線")
MrtLine.create!( :line_code => "2" , :line_name => "淡水信義線")
MrtLine.create!( :line_code => "3" , :line_name => "松山新店線")
MrtLine.create!( :line_code => "4" , :line_name => "中和新蘆線")
MrtLine.create!( :line_code => "5" , :line_name => "板南線")
puts "The MRT Lines have been created"

for i in 1..24
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(1))
end
for i in 25..50
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(2))
end
for i in 51..64
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(3))
end
for i in 65..88
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(4))
end
for i in 89..106
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(5))
end

LocationMrtLineship.create(:location => Location.find_by_id(1) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(14) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(15) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(16) , :mrt_line => MrtLine.find_by_id(2))
LocationMrtLineship.create(:location => Location.find_by_id(40) , :mrt_line => MrtLine.find_by_id(4))
LocationMrtLineship.create(:location => Location.find_by_id(42) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(43) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(45) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(46) , :mrt_line => MrtLine.find_by_id(4))
LocationMrtLineship.create(:location => Location.find_by_id(55) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(82) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(83) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(84) , :mrt_line => MrtLine.find_by_id(3))

puts "Relationships between Location and MrtLine have been created~"


Location.all.each do |location|
  5.times do
    Umbrella.create!( :umbrella_holder_type => "Location", :umbrella_holder_id => location.id,
                      :umbrella_number => SecureRandom.hex(10))
  end
end

95.times do
  Umbrella.create!(:umbrella_holder_type => "Location", :umbrella_holder_id => Location.last.id,
                   :umbrella_number => SecureRandom.hex(10))
end

puts "There are now #{Umbrella.count} rows in the umbrellas table"

Location.pluck(:id).each do |i|
  l = Location.find(i)
  l.umbrella_count = l.umbrellas.size
  l.save!
end

