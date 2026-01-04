class GameStudy < ApplicationRecord
  belongs_to :game
  has_many :game_study_moves
end
