class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :channel_id

  belongs_to :user, serializer: MessageUserSerializer


end
