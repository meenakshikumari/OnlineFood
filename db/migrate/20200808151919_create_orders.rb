class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :payment_mode
      t.float :total_cost

      t.references :restaurant, foreign_key: true ,index: true 
      t.references :user, foreign_key: true ,index: true 

      t.timestamps
    end
  end
end
