class AddUmbrellaCountToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :umbrella_count, :integer, :default => 0

    Location.pluck(:id).each do |i|
      l = Location.find(i)
      l.umbrella_count = l.umbrellas.size
      l.save!
    end
  end
end
