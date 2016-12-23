class ChangeDefaultToUmbrellaTypeAndId < ActiveRecord::Migration[5.0]
  def change
    change_column :umbrellas, :umbrella_holder_type, :string, :default => "Location"
    change_column :umbrellas, :umbrella_holder_id, :integer, :default => 1
  end
end
