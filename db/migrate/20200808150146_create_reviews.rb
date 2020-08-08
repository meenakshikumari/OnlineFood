class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.string :image

      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
