class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @channel = Channel.find(params[:channel_id])
    stream_for @channel
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
