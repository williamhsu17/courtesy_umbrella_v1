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
# User.destroy_all

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

# 文湖線
for i in 1..15
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "5" )
  end
end

for i in 16..17
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end

for i in 18..24
  5.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end

# 淡水信義線
for i in 25..38
  10.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "4" )
  end
end


  8.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "39",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "6" )
  end



  2.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "40",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "6" )
  end

  6.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "40",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end


for i in 41..44
  8.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end


for i in 45..50
  7.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end


# 松江新店線

  3.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "51",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "2" )
  end

  7.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "51",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end


for i in 52..53
  5.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "1" )
  end
end


  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "54",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end

for i in 55..63
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end


  6.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => "64",
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "4" )
  end

#中和新蘆線
for i in 65..75
  10.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "6" )
  end
end

for i in 75..80
  10.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end

for i in 81..88
  7.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end


#板南線
for i in 89..92
  10.times do 
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "5" )
  end
end
for i in 93..103
  8.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "7" )
  end
end

for i in 103..106
  9.times do
    Umbrella.create!( :umbrella_holder_type => "Location", 
                      :umbrella_holder_id => i,
                      :umbrella_number => SecureRandom.hex(10),
                      :rent_count => "11" )
  end
end

100.times do
  Umbrella.create!(:umbrella_holder_type => "Location", :umbrella_holder_id => Location.last.id,
                   :umbrella_number => SecureRandom.hex(10))
end

puts "There are now #{Umbrella.count} rows in the umbrellas table"


e = Enterprise.create!(:name => "ASUS", :description => "computer manufacture")
ac = e.ad_cases.create!(:name => "new game station", :description => "fun", :is_active => false, :case_amount => 10000)
5.times do
  ac.umbrellas.create
end
ac = e.ad_cases.create!(:name => "new transformer 3", :description => "pre launch commercial", :case_amount => 9000)
5.times do
  ac.umbrellas.create
end

e = Enterprise.create!(:name => "Acer", :description => "computer manufacture")
ac = e.ad_cases.create!(:name => "slim laptop", :description => "pre launch commercial", :case_amount => 10000)
5.times do
  ac.umbrellas.create
end

Location.pluck(:id).each do |i|
  l = Location.find(i)
  l.umbrella_count = l.umbrellas.size
  l.save!
end
puts "create an enterprise"
