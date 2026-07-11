class Repertoire < ApplicationRecord
  has_many :repertoire_moves
  has_many :rejected_moves
  has_many :moves, through: :repertoire_moves
end
