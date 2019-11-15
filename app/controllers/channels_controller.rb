class ChannelsController < ApplicationController
  before_action :set_channel, only: [:destroy, :show]

  def create
  end

  def destroy
  end

  def show
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:slug, :team_id).merge(user: current_user)
  end
end
