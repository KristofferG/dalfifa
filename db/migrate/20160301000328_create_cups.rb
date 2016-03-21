class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.string :title
      t.integer :num_players

      t.timestamps null: false
    end
  end
end
