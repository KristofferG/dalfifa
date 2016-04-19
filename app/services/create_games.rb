class CreateGames

  def initialize(player_ids)
    @num_matches = 0
  end

  def create_game(player_ids, cup_id)
    @cup_id = cup_id
    @player_ids = player_ids
    num_players = player_ids.count - 1
    looping = num_players + 2
    @players = player_ids.reject { |c| c.empty? }
    player = []
    def skapa_spelare(id) {
      id: id,
      assigned: 0,
      home: 0,
      away: 0,
      opponents: [],
      coop: [],
      vs_datalag: 0
      }
    end

    @players.each do |p|
      player.push(skapa_spelare(p))
    end

    matches = []
    num_matches = (num_players / 2.0) * (num_players - 1) / 2
  	num_matches = num_matches.to_i

    num_matches.times do | m |
  		player.sort_by! { |hsh| [hsh[:assigned], hsh[:away]] }
  		spelare1 = player[3]
  		spelare2 = player[1]
  		spelare3 = player[0]
  		spelare4 = player[2]
  		looping.times do | i |
  			break unless spelare1[:coop].include?(spelare2[:id]) || spelare1 == spelare2
  			spelare2 = player[i]
  		end
  		looping.times do | i |
  			break unless spelare3 == spelare1 || spelare3 == spelare2
  			spelare3 = player[i]
  		end
  		looping.times do | i |
  			break unless spelare3[:coop].include?(spelare4[:id]) || spelare4 == spelare3 || spelare4 == spelare1 || spelare4 == spelare2
  			spelare4 = player[i]
  		end

      spelare1[:assigned] +=1
  		spelare1[:home] +=1
  		spelare1[:coop].push(spelare2[:id])

  		spelare2[:assigned] +=1
  		spelare2[:home] +=1
  		spelare2[:coop].push(spelare1[:id])

  		spelare3[:assigned] +=1
  		spelare3[:away] +=1
  		spelare3[:coop].push(spelare4[:id])

  		spelare4[:assigned] +=1
  		spelare4[:away] +=1
  		spelare4[:coop].push(spelare3[:id])

      @match = Match.create :cup_id => @cup_id, :player_ids => [spelare1[:id], spelare2[:id], spelare3[:id], spelare4[:id]]
      match_id = @match.id
      CreateResults.new().create_result(match_id, spelare1[:id], spelare2[:id], spelare3[:id], spelare4[:id])
    end
    if num_players == 6 || num_players == 7
      player.sort_by! { |hsh| [hsh[:assigned], hsh[:away]] }
      spelare1 = player[0]
  		spelare2 = player[1]
      @match = Match.create :cup_id => @cup_id, :player_ids => [spelare1[:id], spelare2[:id]]
      match_id = @match.id
      CreateResults.new().create_result_datalag(match_id, spelare1[:id], spelare2[:id])
    end
  end
end
