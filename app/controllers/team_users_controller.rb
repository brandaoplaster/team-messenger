class TeamUsersController < ApplicationController
  before_action :set_team_user, only: [:destroy]

  def create
  end

  def destroy
  end

  private

  def set_team_user
    @team_user = TeamUser.find_by(params[:user_id], params[:team_id])
  end

  def team_user_params
    params.require(:team_user).permit(:team_id, :user_id)
  end
end
