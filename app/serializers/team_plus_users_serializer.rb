class TeamPlusUsersSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :online, :image_url
end
