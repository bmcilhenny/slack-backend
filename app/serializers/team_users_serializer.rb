class TeamUsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :users

  has_many :users, serializer: TeamPlusUsersSerializer
end
