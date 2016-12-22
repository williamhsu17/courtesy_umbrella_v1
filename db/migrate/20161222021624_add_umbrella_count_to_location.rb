class AddUmbrellaCountToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :umbrellas_count, :integer, :default => 0

    Location.pluck(:id).each do |i|
      Location.reset_counters(i, :umbrellas) # 全部重算一次
    end
  end
end
