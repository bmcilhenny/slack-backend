class ChannelSerializer < ActiveModel::Serializer

  attributes :id, :name, :details, :channel_type, :team_id, :readMessages, :unreadMessages, :slug

  has_many :messages, serializer: ChannelMessageSerializer
  has_many :users, serializer: ChannelUserSerializer
  belongs_to :owner, serializer: OwnerSerializer


  def readMessages
    # byebug
    user_channel = UserChannel.find_by(channel_id: object.id, user_id: scope.id)
    readMessages = object.messages.select {|message| message.created_at < user_channel.last_seen  }


    readMessages.map do |message|
      (ActiveModelSerializers::Adapter::Json.new(
        ChannelMessageSerializer.new(message)
      ).serializable_hash)
    end
  end

  def unreadMessages
    user_channel = UserChannel.find_by(channel_id: object.id, user_id: current_user.id)
    unreadMessages = object.messages.select {|message| message.created_at > user_channel.last_seen  }


    unreadMessages.map do |message|
      (ActiveModelSerializers::Adapter::Json.new(
        ChannelMessageSerializer.new(message)
      ).serializable_hash)
    end
  end

end
