class RemoveMoveReferenceFromStockfishScore < ActiveRecord::Migration[8.1]
  def change
    remove_reference :stockfish_scores, :move, null: false, foreign_key: true
  end
end
