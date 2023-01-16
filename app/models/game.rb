class Game < ApplicationRecord
  
  belongs_to :user
  
  enum play_condition: { not_play: 0, play_soon: 1, have_played: 2 }
  enum genre: { ps: 0, switch: 1, ds: 2, steam: 3, pc: 4, smartphone: 5, other: 6 }
end
