class AddRestaurantReferenceToMenuItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :menu_items, :restaurant, foreign_key: true ,index: true 
  end
end
