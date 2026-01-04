class AddColorToGameStudies < ActiveRecord::Migration[8.1]
  def change
    add_column :game_studies, :color, :string
  end
end
