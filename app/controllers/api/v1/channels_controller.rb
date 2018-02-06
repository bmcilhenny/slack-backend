class Api::V1::ChannelsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :show]

  def index
    @channels = Channel.all
    render json: @channels
  end

  def show
    @channel = Channel.find(params[:id])
    render json: @channel
  end

  def update
    @channel = Channel.find(params[:id])

    @channel.update(channel_params)
    if @channel.save
      render json: @channel
    else
      render json: {errors: @channel.errors.full_messages}, status: 422
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
  end

  private
  def channel_params
    params.permit(:name, :details)
  end
end
