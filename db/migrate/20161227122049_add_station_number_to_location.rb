class AddStationNumberToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :station_number1, :string
    add_column :locations, :station_number2, :string
  end
end
