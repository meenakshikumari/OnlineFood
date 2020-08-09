class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :rating, default: 0.0
      t.text :comment
      t.string :image

      t.references :restaurant, foreign_key: true ,index: true 

      t.timestamps
    end
  end
end
