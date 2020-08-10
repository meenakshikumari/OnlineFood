class Restaurant < ApplicationRecord
  serialize :tags, Array
  serialize :cuisines, Array

  has_one :address,  as: :location, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  has_many :reviews
  has_many :orders

  validates_presence_of :address, :menu_items

  scope :active, -> { where status: true }
end
