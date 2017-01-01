class AddAdCaseToUmbrella < ActiveRecord::Migration[5.0]
  def change
    add_column :umbrellas, :ad_case_id, :integer, :index => true
    remove_column :umbrellas, :enterprise_id
  end
end
