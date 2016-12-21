class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :station
      t.integer :exit_number
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
    add_index :locations, :station
  end
end
