class Move < ApplicationRecord
  validates_uniqueness_of :before, scope: [:from, :to]
  has_one :stockfish_score

  ATTRIBUTES = %i(after before captured color flags from lan piece promotion san to)

  def as_json(options = nil)
    super methods: :evaluation
  end

  def evaluation
    return 0 unless stockfish_score
    stockfish_score.score * -1
  end
end
