class CreateRejectedMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :rejected_moves do |t|
      t.references :move, null: false, foreign_key: true
      t.references :repertoire, null: false, foreign_key: true

      t.timestamps
    end
  end
end
