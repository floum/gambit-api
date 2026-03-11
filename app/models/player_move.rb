class PlayerMove < ApplicationRecord
  belongs_to :move
  belongs_to :player
end
