class CreateMrtLines < ActiveRecord::Migration[5.0]
  def change
    create_table :mrt_lines do |t|
      t.integer :line_code
      t.string :line_name

      t.timestamps
    end
  end
end
