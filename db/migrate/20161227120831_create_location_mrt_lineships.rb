class CreateLocationMrtLineships < ActiveRecord::Migration[5.0]
  def change
    create_table :location_mrt_lineships do |t|
      t.integer :location_id
      t.integer :mrt_line_id

      t.timestamps
    end
    add_index :location_mrt_lineships, :location_id
    add_index :location_mrt_lineships, :mrt_line_id
  end
end
