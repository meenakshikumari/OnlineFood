class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :functional_hours
      t.string :image
      t.boolean :available_for_order
      t.boolean :active
      t.boolean :veg
      t.float :rating
      t.string :cost_for_two
      t.string :tags
      t.string :cuisines

      t.timestamps
    end
  end
end
