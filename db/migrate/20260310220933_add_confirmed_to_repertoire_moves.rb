class AddConfirmedToRepertoireMoves < ActiveRecord::Migration[8.1]
  def change
    add_column :repertoire_moves, :confirmed, :boolean
  end
end
