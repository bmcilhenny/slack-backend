class ChannelsChannel < ApplicationCable::Channel
  def subscribed

    stream_from "channels_channel_#{params[:id]}"
  end

  def unsubscribed
    user = User.find(params[:current_user_id])
    user.update!(online: false)
    team = user.team

    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      TeamUsersSerializer.new(team)
    ).serializable_hash

    ActionCable.server.broadcast('my_channel', {
      type: "USER_OFFLINE",
      payload: serialized_data
    })

    stop_all_streams
  end
end
