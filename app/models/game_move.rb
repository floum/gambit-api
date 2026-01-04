class GameMove < ApplicationRecord
  belongs_to :move
  belongs_to :game
end
