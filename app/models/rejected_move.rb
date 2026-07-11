class RejectedMove < ApplicationRecord
  belongs_to :move
  belongs_to :repertoire

  delegate :before, to: :move
  delegate :san, to: :move

  def fen
    before
  end
end
