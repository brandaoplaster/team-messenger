class TeamsController < ApplicationController
  before_action :set_team, only: [:destroy]
  before_action :set_by_slug_team, only: [:show]

  def index
    @team = current_user.teams
  end

  def show
    authorize! :read, @team
  end

  def create
  end

  def destroy
    authorize! :destroy, @team
    @team.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
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
