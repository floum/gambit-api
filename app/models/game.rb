class Game < ApplicationRecord
  validates_presence_of :pgn
  has_many :game_moves, dependent: :destroy
  has_many :game_studies, dependent: :destroy
  has_many :moves, through: :game_moves

  def first_mistake
    moves
      .sort_by(&:ply)
      .find { |move| (move.cpl || 0) > 100 }
  end
end
