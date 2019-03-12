class TeammatesSerializer < ActiveModel::Serializer
  attributes :users
  has_many :users, serializer: TeamPlusUsersSerializer
end
