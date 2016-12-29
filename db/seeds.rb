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

Location.create!( :name => "儲存點")

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

puts "There are now #{Location.count} rows in the locations table"

MrtLine.create!( :line_code => "1" , :line_name => "文湖線")
MrtLine.create!( :line_code => "2" , :line_name => "淡水信義線")
MrtLine.create!( :line_code => "3" , :line_name => "松山新店線")
MrtLine.create!( :line_code => "4" , :line_name => "中和新蘆線")
MrtLine.create!( :line_code => "5" , :line_name => "板南線")
puts "The MRT Lines have been created"

for i in 2..25
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(1))
end
for i in 26..51
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(2))
end
for i in 52..65
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(3))
end
for i in 66..89
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(4))
end
for i in 90..107
   LocationMrtLineship.create(:location => Location.find_by_id(i) , :mrt_line => MrtLine.find_by_id(5))
end

LocationMrtLineship.create(:location => Location.find_by_id(2) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(15) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(16) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(17) , :mrt_line => MrtLine.find_by_id(2))
LocationMrtLineship.create(:location => Location.find_by_id(41) , :mrt_line => MrtLine.find_by_id(4))
LocationMrtLineship.create(:location => Location.find_by_id(43) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(44) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(46) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(47) , :mrt_line => MrtLine.find_by_id(4))
LocationMrtLineship.create(:location => Location.find_by_id(56) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(83) , :mrt_line => MrtLine.find_by_id(3))
LocationMrtLineship.create(:location => Location.find_by_id(84) , :mrt_line => MrtLine.find_by_id(5))
LocationMrtLineship.create(:location => Location.find_by_id(85) , :mrt_line => MrtLine.find_by_id(3))

puts "Relationships between Location and MrtLine have been created~"

90.times do 
  Umbrella.create!(:umbrella_holder_type => "Location", :umbrella_holder_id => "1",
                   :umbrella_number => SecureRandom.hex(10))
end
Location.all.each do |location|
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", :umbrella_holder_id => location.id,
                      :umbrella_number => SecureRandom.hex(10))
  end
end
puts "There are now #{Umbrella.count} rows in the umbrellas table"

