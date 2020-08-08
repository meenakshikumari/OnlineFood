class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :payment_mode
      t.float :total_cost

      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
