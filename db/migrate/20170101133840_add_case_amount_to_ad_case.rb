class AddCaseAmountToAdCase < ActiveRecord::Migration[5.0]
  def change
    add_column :ad_cases, :case_amount, :integer, :default => 0
  end
end
