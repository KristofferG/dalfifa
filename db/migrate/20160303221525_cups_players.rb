class CupsPlayers < ActiveRecord::Migration
  def change
    create_table :cups_players, :id => false do |t|
      t.integer :cup_id
      t.integer :player_id
    end
  end
end
