class CreateAdCases < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_cases do |t|
      t.string :name
      t.text :description
      t.integer :enterprise_id

      t.timestamps
    end
  end
end
