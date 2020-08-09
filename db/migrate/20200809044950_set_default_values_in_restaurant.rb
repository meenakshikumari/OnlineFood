class SetDefaultValuesInRestaurant < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :rating, :float, default: 0.0
    change_column :restaurants, :available_for_order, :boolean, default: true
    change_column :restaurants, :active, :boolean, default: true
    change_column :restaurants, :veg, :boolean, default: true
  end
end
