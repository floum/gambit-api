class AddStatusToRepertoireMove < ActiveRecord::Migration[8.1]
  def change
    add_column :repertoire_moves, :status, :string
  end
end
