class Move < ApplicationRecord
  validates_uniqueness_of :before, scope: [:from, :to]
end
