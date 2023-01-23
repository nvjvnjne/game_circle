class Game < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre

  # お気に入り機能
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  # ゲーム画像実装
  has_one_attached :image
  
  # プレイ状況をenumで実装
  enum play_condition: { not_play: 0, play_soon: 1, have_played: 2 }
end
