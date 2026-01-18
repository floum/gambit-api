class Move < ApplicationRecord
  validates_uniqueness_of :before, scope: [:from, :to]

  ATTRIBUTES = %i(after before captured color flags from lan piece promotion san to)

  def as_json(options = nil)
    super methods: :evaluation
  end

  def evaluation
    return 0 unless stockfish_score
    stockfish_score.score * -1
  end

  def ply
    (before.split(' ').last.to_i - 1) * 2 + (white? ? 0 : 1)
  end

  def white?
    color == 'w'
  end

  def black?
    !white?
  end

  def score_before
    score = StockfishScore.find_by(fen: before)
    score.score if score
  end

  def score_after
    score = StockfishScore.find_by(fen: after)
    score.score if score
  end

  def cpl
    if (score_after && score_before)
      (score_after * -1 - score_before) * -100
    end
  end
end
