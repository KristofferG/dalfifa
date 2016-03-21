class FixturesController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index, :update, :show, :edit]
  def index
    @fixtures = Fixture.all
  end

  def show


    @fixture = Fixture.find(params[:id])
  end

  def create
    @cup = Cup.find(params[:cup_id])
    @fixture = @cup.fixtures.create(fixture_params)
    redirect_to cup_path(@cup)
  end

  def destroy
    @fixture = Fixture.find(params[:id])
    @fixture.destroy

    redirect_to fictures_path
  end

  private
    def fixture_params
      params.require(:fixture).permit(:games_assigned, :games_played, :goals_f, :goals_a, :points, :cup_id, :player_id, :coop => [])
    end
end
