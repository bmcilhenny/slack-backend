class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :display_name, :image_url, :owned_channels, :team

  has_many :channels
  has_many :owned_channels
  has_many :messages
  belongs_to :team

end
