class Restaurant < ApplicationRecord
  has_one :address,  as: :location, dependent: :destroy
end
