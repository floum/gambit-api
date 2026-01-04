class CreateGameStudyMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :game_study_moves do |t|
      t.references :move, null: false, foreign_key: true
      t.references :game_study, null: false, foreign_key: true

      t.timestamps
    end
  end
end
