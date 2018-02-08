class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :details, :channel_type

  has_many :messages, serializer: ChannelMessageSerializer
  has_many :users, serializer: ChannelUserSerializer
  belongs_to :owner, serializer: OwnerSerializer

end
