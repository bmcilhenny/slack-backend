class Api::V1::ChannelsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :show]

  def index
    @channels = Channel.all
    render json: @channels
  end

  def create
    # if params[:details] === '' && params[:name] === '' params[:details] === ''
    #   params[:details] = nil, params[:name] = nil, par
    byebug
    @channel = Channel.new(name: params[:name], owner_id: params[:owner_id], details: params[:details], channel_type: params[:channel_type])
    if @channel.save
      users = params[:users]
      users.each do |u|
        user = User.find(u)
        user.channels << @channel
      end

      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChannelSerializer.new(@channel)
      ).serializable_hash

      ActionCable.server.broadcast('my_channel', {
        type: "NEW_#{@channel[:channel_type]}",
        payload: serialized_data
      })
      # render json: @channel
    else
      render json: {error: 'Could not create that channel'}, status: 422
    end
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
    params.permit(:name, :details, :owner_id, :users, :channel_type)
  end
end
