class CreatePlayerMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :player_moves do |t|
      t.references :move, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
