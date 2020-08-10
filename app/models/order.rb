class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  has_many :order_details, dependent: :destroy

  validates_presence_of :order_details
end
