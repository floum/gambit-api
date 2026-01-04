class Game < ApplicationRecord
  validates_presence_of :pgn
  has_many :game_moves
end
