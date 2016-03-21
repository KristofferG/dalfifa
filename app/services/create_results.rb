class CreateResults

  def initialize()
  end

  def create_result(match_id, sp1, sp2, sp3, sp4)
    @match = Match.find(match_id.to_i)
    spelare1 = sp1
    spelare2 = sp2
    spelare3 = sp3
    spelare4 = sp4

    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare1, :coop => spelare2, :opps => [spelare3, spelare4]
    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare2, :coop => spelare1, :opps => [spelare3, spelare4]
    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare3, :coop => spelare4, :opps => [spelare1, spelare2]
    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare4, :coop => spelare3, :opps => [spelare1, spelare2]
  end
  def create_result_datalag(match_id, sp1, sp2)
    @match = Match.find(match_id.to_i)
    spelare1 = sp1
    spelare2 = sp2

    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare1, :coop => spelare2
    Result.create :match_id => @match[:id], :cup => @match.cup.id, :player_id => spelare2, :coop => spelare1
  end
end
