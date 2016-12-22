class AddIsReturnToRentHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :rent_histories, :is_returned, :boolean, :default => false
  end
end
