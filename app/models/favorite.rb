class Favorite < ApplicationRecord
  
  validates :user_id, uniqueness: { scope: :game_id }

  # アソシエーション
  belongs_to :user
  belongs_to :game


end
