class AddAttributesToGames < ActiveRecord::Migration[8.1]
  def change
    add_column :games, :played, :date
    add_column :games, :white, :string
    add_column :games, :black, :string
    add_column :games, :result, :string
  end
end
