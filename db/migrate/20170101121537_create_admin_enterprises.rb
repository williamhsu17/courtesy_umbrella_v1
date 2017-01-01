class CreateAdminEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_enterprises do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
