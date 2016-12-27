class AddColumnToUmbrella < ActiveRecord::Migration[5.0]
  def change
    add_column :umbrellas, :description, :text
    add_column :umbrellas, :umbrella_number, :integer
    add_column :umbrellas, :rent_count, :integer, :default => 0
    add_index :umbrellas, :umbrella_number
  end
end
