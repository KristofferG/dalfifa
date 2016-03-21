class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :points
      t.integer :goals_f
      t.integer :goals_a
      t.integer :coop
      t.text :opps
      t.integer :cup
      t.references :match, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
