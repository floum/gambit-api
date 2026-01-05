class GameStudyMove < ApplicationRecord
  belongs_to :move
  belongs_to :game_study

  validates_presence_of :move
  validates_presence_of :game_study

  delegate :san, to: :move
end
