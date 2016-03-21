class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team1_score
      t.integer :team2_score
      t.references :cup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
