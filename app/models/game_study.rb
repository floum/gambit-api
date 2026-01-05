class GameStudy < ApplicationRecord
  belongs_to :game
  has_many :moves, through: :game
  has_many :game_study_moves, dependent: :destroy

  def expected_moves
    moves.where(color: color)
  end

  def progress
    "#{game_study_moves.count} / #{expected_moves.count}"
  end

  def complete?
    game_study_moves.count == expected_moves.count
  end
  
  alias_method :complete, :complete?
end
