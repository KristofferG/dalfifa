class CreateFixtures

  def initialize()
  end

  def create_fixture(player_ids, cup_id)
    @cup_id = cup_id
    @player_ids = player_ids
    @num_players = player_ids.count - 1
    @players = player_ids.reject { |c| c.empty? }


    @players.each do |p|
      p = p.to_i
      Fixture.create :cup_id => @cup_id, :player_id => p, :games_played => 0, :home => 0, :away => 0, :points => 0, :goals_f => 0, :goals_a => 0
    end

  end
end
