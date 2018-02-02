class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at

  belongs_to :user
  belongs_to :channel
end
