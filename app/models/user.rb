class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_one :address,  as: :location, dependent: :destroy
  has_many :reviews

  validates_presence_of :address

  scope :active, -> { where is_active: true }

end
