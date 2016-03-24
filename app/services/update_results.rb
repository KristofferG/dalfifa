class UpdateResults

  def initialize()
  end

  def update_result(params)

    params['match'].keys.each do |id|
      @match = Match.find(id.to_i)
      @cup_id = @match.cup.id
      @results = Result.where(match_id: id.to_i)
      team1_score = @match[:team1_score]
      team2_score = @match[:team2_score]

      if team1_score.nil?
        team1_points = 0
        team2_points = 0
      elsif team1_score == team2_score
    		team1_points = 1
    		team2_points = 1
    	elsif team1_score > team2_score
    		team1_points = 3
    		team2_points = 0
    	else
    		team1_points = 0
    		team2_points = 3
    	end
      if @results[0][:opps].nil?
        @results[0].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[1].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
      else
        @results[0].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[1].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[2].update_attributes(:goals_f => team2_score, :goals_a => team1_score, :points => team2_points)
        @results[3].update_attributes(:goals_f => team2_score, :goals_a => team1_score, :points => team2_points)
      end
    end
    UpdateFixtures.new().update_fixture(@cup_id)
  end

  def update_single_result(params)

      @match = Match.find(params[:id])
      @cup_id = @match.cup.id
      @results = Result.where(match_id: params[:id])
      team1_score = @match[:team1_score]
      team2_score = @match[:team2_score]

      if team1_score.nil?
        team1_points = 0
        team2_points = 0
      elsif team1_score == team2_score
        team1_points = 1
        team2_points = 1
      elsif team1_score > team2_score
        team1_points = 3
        team2_points = 0
      else
        team1_points = 0
        team2_points = 3
      end
      if @results[0][:opps].nil?
        @results[0].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[1].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
      else
        @results[0].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[1].update_attributes(:goals_f => team1_score, :goals_a => team2_score, :points => team1_points)
        @results[2].update_attributes(:goals_f => team2_score, :goals_a => team1_score, :points => team2_points)
        @results[3].update_attributes(:goals_f => team2_score, :goals_a => team1_score, :points => team2_points)
      end
    UpdateFixtures.new().update_fixture(@cup_id)
  end
end
