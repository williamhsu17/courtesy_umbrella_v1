class ChangeColumnUmbrellaNumberToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :umbrellas, :umbrella_number, :integer
    add_column :umbrellas, :umbrella_number, :string
  end
end
