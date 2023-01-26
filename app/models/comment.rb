class Comment < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :game
  
  #バリデーション
  validates :comment, presence: { message: 'を入力してください' }
  
end
