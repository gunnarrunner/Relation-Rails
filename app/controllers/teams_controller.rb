class TeamsController < ApplicationController
  def index
    @teams = Team.order_create_date
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    if params[:alphabetical]
      @team_players = @team.players.players_alphabetically
    else
      @team_players = @team.players
    end
  end

  def new
  end

  def create
    team = Team.create(teams_params)
    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(teams_params)
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to '/teams'
  end

  private
  def teams_params
    params.permit(:name, :wins, :champions)
  end
end