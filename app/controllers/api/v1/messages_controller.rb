class Api::V1::MessagesController < ApplicationController

  skip_before_action :authorized, only: [:show]

  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    message = Message.new(content: params[:content], user_id: 3, channel_id: 2)
    if message.save
      ActionCable.broadcast('my_channel', message)
      render json: message
    else
      render json: {error: 'Could not create that message'}, status: 422
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
