class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :details

  has_many :messages, serializer: ChannelMessageSerializer
  # has_many :users
  belongs_to :owner, serializer: OwnerSerializer

end
