class MatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_players, :id => false do |t|
      t.integer :match_id
      t.integer :player_id
    end
  end
end
