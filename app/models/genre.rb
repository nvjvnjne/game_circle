class Genre < ApplicationRecord

  # アソシエーション
  has_many :games, dependent: :destroy

  validates :name, presence: { message: 'を入力してください' }
end
