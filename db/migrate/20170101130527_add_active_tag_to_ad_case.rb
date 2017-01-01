class AddActiveTagToAdCase < ActiveRecord::Migration[5.0]
  def change
    add_column :ad_cases, :is_active, :boolean, :default => true
  end
end
