class GameStudy < ApplicationRecord
  belongs_to :game
  has_many :game_study_moves, dependent: :destroy

  def progress
    "#{game_study_moves.count} / #{game.moves.where(color: color).count}"
  end
end
