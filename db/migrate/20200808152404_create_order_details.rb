class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.string :status, default: "Pending"
      t.float :cost, default: 0.0
      t.string :menu_item_name
      t.integer :quantity, default: 1

      t.references :menu_item, foreign_key: true ,index: true 
      t.references :order, foreign_key: true ,index: true 

      t.timestamps
    end
  end
end
