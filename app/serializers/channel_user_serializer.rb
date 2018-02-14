class ChannelUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :display_name, :last_seen, :online, :image_url

  def last_seen
    user = User.find(@object.id)
    user.user_channels.last
    # @object.user_channels.last
  end
end
