class Api::V1::MessagesController < ApplicationController

  skip_before_action :authorized, only: [:index, :show, :create]

  def index
    @messages = Message.all
    render json: @messages, include: ['user', 'user.display_name', 'user.id']
  end

  def create
    @message = Message.new(content: params[:content], user_id: params[:user_id], channel_id: params[:channel_id])
    if @message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash

      # byebug

      ActionCable.server.broadcast('my_channel', {
        type: 'NEW_MESSAGE',
        payload: serialized_data
      })
      # render json: @message
    else
      render json: {error: 'Could not create that message'}, status: 422
    end
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def update
    @message = Message.find(params[:id])

    @message.update(message_params)
    if @message.save
      render json: @message
    else
      render json: {errors: @message.errors.full_messages}, status: 422
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end


  private
  def message_params
    params.permit(:content, :user_id, :channel_id)
  end
end
