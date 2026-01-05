class GameMove < ApplicationRecord
  belongs_to :move
  belongs_to :game

  delegate :san, to: :move
end
