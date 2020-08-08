class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.boolean :veg
      t.integer :price
      t.boolean :available,   default: true
      t.text    :description

      t.timestamps
    end
  end
end
