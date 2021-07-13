class TeamsController < ApplicationController
  def index
    @teams = Team.order_create_date
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @team = Team.find(params[:id])
    @team_players = @team.players
  end

  def new
    
  end

  def create
    team = Team.create(teams_params)
    redirect_to '/teams'
  end

  # def edit
    
  # end

  # def update
    
  # end

  # def destroy
    
  # end

  private
  def teams_params
    params.permit(:name, :wins, :champions)
  end
end