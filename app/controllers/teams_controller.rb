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

  # def new
    
  # end

  # def create
    
  # end

  # def edit
    
  # end

  # def update
    
  # end

  # def destroy
    
  # end

  # private
  # def _params
  #   params.permit(:)
  # end
end