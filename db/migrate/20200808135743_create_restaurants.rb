class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.time :open_time
      t.time :close_time
      t.string :image
      t.boolean :available_for_order, default: true
      t.boolean :active, default: true
      t.boolean :veg, default: false
      t.float :rating, default: 0.0
      t.integer :cost_for_two, default: 0
      t.string :tags
      t.string :cuisines

      t.timestamps
    end
  end
end
