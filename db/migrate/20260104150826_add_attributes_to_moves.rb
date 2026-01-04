class AddAttributesToMoves < ActiveRecord::Migration[8.1]
  def change
    add_column :moves, :promotion, :string
    add_column :moves, :captured, :string
  end
end
