class ChannelChannel < ApplicationCable::Channel
  def subscribed
    stream_from "my_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
