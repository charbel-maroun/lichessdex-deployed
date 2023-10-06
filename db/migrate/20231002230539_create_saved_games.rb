class CreateSavedGames < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_games do |t|
      t.string :studiedPosition
      t.string :notes
      t.integer :gameID

      t.timestamps
    end
  end
end
