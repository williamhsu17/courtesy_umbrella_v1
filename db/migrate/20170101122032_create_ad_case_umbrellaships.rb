class CreateAdCaseUmbrellaships < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_case_umbrellaships do |t|
      t.integer :ad_case_id
      t.integer :umbrella_id

      t.timestamps
    end
  end
end
