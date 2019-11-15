class ChannelsController < ApplicationController
  before_action :set_channel, only: [:destroy, :show]

  def create
    @channel = Channel.new(channel_params)
    authorize! :create, @channel

    respond_to do |format|
      if @channel.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
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
