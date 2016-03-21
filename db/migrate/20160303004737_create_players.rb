class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :games_played
      t.integer :home
      t.integer :away
      t.integer :points
      t.integer :goals

      t.timestamps null: false
    end
  end
end
