class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :display_name, :image_url
end
