class Game < ApplicationRecord
  validates_presence_of :pgn
  has_many :game_moves, dependent: :destroy
  has_many :game_studies, dependent: :destroy
end
