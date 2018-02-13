class ChannelChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    stream_from "my_channel"
    user = User.find(params[:current_user_id])
    if user.online

    else
      user.update!(online: true)
      team = user.team

      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        TeamUsersSerializer.new(team)
      ).serializable_hash

      ActionCable.server.broadcast('my_channel', {
        type: "USER_ONLINE",
        payload: serialized_data
        })
    end


  end

  def unsubscribed
    # byebug
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

  end
end
