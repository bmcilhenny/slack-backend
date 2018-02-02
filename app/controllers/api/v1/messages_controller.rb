class Api::V1::MessagesController < ApplicationController

  skip_before_action :authorized, only: [:show]

  def index
    @messages = Message.all
    render json: @messages
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
    params.permit(:content)
  end
end
