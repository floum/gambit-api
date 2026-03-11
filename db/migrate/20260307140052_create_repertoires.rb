class CreateRepertoires < ActiveRecord::Migration[8.1]
  def change
    create_table :repertoires do |t|
      t.string :name
      t.boolean :white

      t.timestamps
    end
  end
end
