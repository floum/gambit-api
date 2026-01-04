class Move < ApplicationRecord
  validates_uniqueness_of :before, scope: [:from, :to]

  ATTRIBUTES = %i(after before captured color flags from lan piece promotion san to)
end
