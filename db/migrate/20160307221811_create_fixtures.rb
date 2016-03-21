class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :games_assigned
      t.text :coop
      t.integer :games_played
      t.integer :home
      t.integer :away
      t.integer :points
      t.integer :goals_f
      t.integer :goals_a
      t.references :cup, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
