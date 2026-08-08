class RemoveConfirmedFromRepertoireMoves < ActiveRecord::Migration[8.1]
  def change
    remove_column :repertoire_moves, :confirmed
  end
end
