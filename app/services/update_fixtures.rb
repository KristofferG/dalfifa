class UpdateFixtures

  def initialize()
  end

  def update_fixture(cup_id)
    @fixtures = Fixture.where(cup_id: cup_id)
    @results = Result.where(cup: cup_id)
    @fixtures.each do |fixture|
      points = Result.where(cup: cup_id, player_id: fixture.player_id).sum(:points)
      goals_f = Result.where(cup: cup_id, player_id: fixture.player_id).sum(:goals_f)
      goals_a = Result.where(cup: cup_id, player_id: fixture.player_id).sum(:goals_a)
      fixture.update_attributes(:points => points, :goals_f => goals_f, :goals_a => goals_a)
    end
    @fixtures.each do |fixture|
      games_played = Result.where(cup: cup_id, player_id: fixture.player_id, goals_a: 0..9).count
      fixture.update_attributes(:games_played => games_played)
    end

    @players = Player.all
    @players.each do |player|
      points = Result.where(player_id: player.id).sum(:points)
      goals_f = Result.where(player_id: player.id).sum(:goals_f)
      goals_a = Result.where(player_id: player.id).sum(:goals_a)
      pm = goals_f - goals_a
      player.update_attributes(:points => points, :goals_f => goals_f, :goals_a => goals_a, :goals => pm)
    end
    @players.each do |player|
      games_played = Result.where(player_id: player.id, goals_a: 0..9).count
      player.update_attributes(:games_played => games_played)
    end
  end
end
