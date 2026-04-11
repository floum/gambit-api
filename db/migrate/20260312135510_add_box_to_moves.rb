class AddBoxToMoves < ActiveRecord::Migration[8.1]
  def change
    add_column :moves, :box, :boolean
  end
end
