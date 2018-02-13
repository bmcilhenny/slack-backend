class ChannelChannel < ApplicationCable::Channel
  def subscribed
    stream_from "my_channel"
  end

  def unsubscribed
    user = User.find([params[:id]])
    # user.user_channels.find_by(channel_id: [params[:channel_id]])
    # UserChannel.find(user: user, channel: [params[:channel_id]])
  end
end
