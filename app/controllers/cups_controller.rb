class CupsController < ApplicationController
skip_before_action :authorize, only: [:new, :create, :index, :update, :show]
  def index
    @cups = Cup.all
  end

  def show
    @cup = Cup.find(params[:id])
  end

  def new
    @cup = Cup.new
    @players = Player.all
  end

  def edit
    @cup = Cup.find(params[:id])
    @players = Player.all
  end

  def create
    @cup = Cup.new(cup_params)

    if @cup.save
      redirect_to @cup
    else
      render 'new'
    end
    cup_id = @cup.id

    CreateFixtures.new().create_fixture(params[:cup][:player_ids], cup_id)

    CreateGames.new(params[:cup][:player_ids]).create_game(params[:cup][:player_ids], cup_id)
  end

  def update
    @cup = Cup.find(params[:id])

    if @cup.update(cup_params)
      redirect_to @cup
    else
      redirect_to @cup
    end
  end

  def destroy
    @cup = Cup.find(params[:id])
    @cup.destroy

    redirect_to cups_path
  end

  @players = Player.all

  @matches = Match.all

  private
    def cup_params
      params.require(:cup).permit(:title, :num_players, :official, :player_ids =>[])
    end
end
