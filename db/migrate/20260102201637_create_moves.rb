class CreateMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :moves do |t|
      t.string :color
      t.string :piece
      t.string :from
      t.string :to
      t.string :san
      t.string :flags
      t.string :lan
      t.string :before
      t.string :after

      t.timestamps
    end
  end
end
