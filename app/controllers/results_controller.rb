class ResultsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index, :update, :show]
  def index
    @results = Result.all
  end

  def show
    @results = Result.find(params[:id])
  end

  def create
    @match = Match.find(params[:match_id])
    @player = Player.find(params[:player_id])
    @result = @match.results.create(result_params)
  end

  private
    def result_params
      params.require(:result).permit(:goals_f, :goals_a, :points, :coop, :opps)
    end
end
