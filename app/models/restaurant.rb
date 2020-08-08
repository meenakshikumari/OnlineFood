class Restaurant < ApplicationRecord
  has_one :address,  as: :location, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  has_many :reviews
  has_many :orders
end
