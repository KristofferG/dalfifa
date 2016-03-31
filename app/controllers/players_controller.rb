class PlayersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index, :update, :show]
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
    @cups = Cup.all
  end

  def edit
    @player = Player.find(params[:id])
    @cups = Cup.all
  end

  def create
    @player = Player.new(player_params)

    @player.save
    @player.update_attributes(:games_played => 0, :points => 0, :goals_f => 0, :goals => 0)
    redirect_to @player
  end
  @cups = Cup.all
  @matches = Match.all

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to players_path
    else
      redirect_to @player
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to players_path
  end

  private
    def player_params
      params.require(:player).permit(:name, :avatar, :cup_ids => [], :match_ids => [])
    end
  end
