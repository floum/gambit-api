class RepertoireMove < ApplicationRecord
  belongs_to :move
  belongs_to :repertoire

  delegate :before, to: :move
  delegate :san, to: :move
  delegate :box, to: :move
  delegate :crushing, to: :move

  validate :unique_move_in_repertoire

  validates :status, inclusion: { in: %w(confirmed rejected) }, allow_nil: true

  def fen
    before
  end

  private

  def unique_move_in_repertoire
    return unless repertoire && move

    if RepertoireMove.joins(:move)
        .where(repertoire_id: repertoire_id)
        .where(move: { before: move.before })
        .where.not(id: id)
        .exists?

      errors.add(:base, "Combination of Move.before and Repertoire must be unique")
    end
  end
end
