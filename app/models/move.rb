class Move < ApplicationRecord
  validates_uniqueness_of :before, scope: [:from, :to]

  ATTRIBUTES = %i(after before captured color flags from lan piece promotion san to)

  def game_changer?
    advantage_drop? || breaking_equality? || advantage_switch?
  end

  def advantage_drop?
    return false unless eval_before && eval_after
    eval_before.abs > 3 && eval_after.abs < 1
  end

  def breaking_equality? 
    return false unless eval_before && eval_after
    eval_before.abs < 1 && eval_after.abs > 2
  end

  def advantage_switch?
    return false unless eval_before && eval_after
    eval_before * eval_after < 0
  end

  def as_json(options = nil)
    super methods: :evaluation
  end

  def eval_before
    return unless score_before
    score_before * (white? ? 1 : -1)
  end

  def eval_after
    return unless score_after
    score_after * (white? ? -1 : 1)
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
