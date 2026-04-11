class AddCrushingToMoves < ActiveRecord::Migration[8.1]
  def change
    add_column :moves, :crushing, :boolean
  end
end
