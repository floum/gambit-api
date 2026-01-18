class AddFenToStockfishScore < ActiveRecord::Migration[8.1]
  def change
    add_column :stockfish_scores, :fen, :string
  end
end
