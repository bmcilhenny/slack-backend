class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  belongs_to :user
  belongs_to :channel

end
