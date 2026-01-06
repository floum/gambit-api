class CreateStockfishScores < ActiveRecord::Migration[8.1]
  def change
    create_table :stockfish_scores do |t|
      t.references :move, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
