class Game < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  
  has_one_attached :image
  # プレイ状況、ジャンルをenumで実装
  enum play_condition: { not_play: 0, play_soon: 1, have_played: 2 }
  enum genre: { ps: 0, switch: 1, ds: 2, steam: 3, pc: 4, smartphone: 5, other: 6 }
end
