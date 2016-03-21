class MatchesController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index, :update, :show, :edit, :update_matches]
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def edit
    @match = Match.find(params[:id])
  end

  def edit_matches
    @matches = Match.all
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match
    else
      render 'new'
    end
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(match_params)
      redirect_to @match
    else
      redirect_to 'index', notice:"Resultat uppdaterat"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to matches_path
  end

  def update_matches
    params['match'].keys.each do |id|
      @match = Match.find(id.to_i)
      @match.update_attributes(m_params(id))
      UpdateResults.new().update_result(params)
    end
  redirect_to :back
  end

  @players = Player.all
  @cups = Cup.all

  private
    def match_params
      params.require(:match).permit(:team1_score, :team2_score, :cup_id, :id, :player_ids => [])
    end

    def m_params(id)
      params.require(:match).fetch(id).permit( :team1_score, :team2_score )
    end
  end
