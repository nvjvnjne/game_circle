class Genre < ApplicationRecord

  # アソシエーション
  has_many :games, dependent: :destroy
end
