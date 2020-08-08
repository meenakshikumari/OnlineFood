class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.string :status
      t.float :cost
      t.string :menu_item_name
      t.integer :quantity

      t.references :menu_item, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
