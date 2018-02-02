class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :display_name, :image_url

  has_many :channels
  has_many :owned_channels
  has_many :messages

end
