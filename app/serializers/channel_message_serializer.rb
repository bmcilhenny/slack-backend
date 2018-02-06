class ChannelMessageSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user, serializer: MessageUserSerializer
end
