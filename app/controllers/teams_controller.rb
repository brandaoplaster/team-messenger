class TeamsController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def set_by_slug_team
    @team = Team.find_by(slug: params[:slug])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:slug).merge(user: current_user)
  end
end
