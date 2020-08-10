class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :user, uniqueness: { scope: :restaurant }

  after_save :update_restro_rating

  private

  def update_restro_rating
    self.restaurant.update_column(:rating, Review.where(restaurant_id: self.restaurant_id).average(:rating).to_f)
  end
end
