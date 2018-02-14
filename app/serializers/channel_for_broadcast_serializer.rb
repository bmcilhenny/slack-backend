class ChannelForBroadcastSerializer < ActiveModel::Serializer
  attributes :id, :name, :details, :channel_type, :team_id, :unreadMessages, :readMessages

  # has_many :messages, serializer: ChannelMessageSerializer
  has_many :users, serializer: ChannelUserSerializer
  belongs_to :owner, serializer: OwnerSerializer

  def readMessages
    []
  end

  def unreadMessages
    []
  end

end
