class CreateRentHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :rent_histories do |t|
      t.integer :umbrella_id
      t.integer :user_id
      t.integer :start_location_id
      t.datetime :start_time
      t.integer :end_location_id
      t.datetime :end_time
      t.integer :amount, :default => 0, :null => false

      t.timestamps
    end
    add_index :rent_histories, :umbrella_id
    add_index :rent_histories, :user_id
  end
end
