class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :details

  has_many :messages
  has_many :users
  belongs_to :owner

end
