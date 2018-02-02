class Channel < ApplicationRecord
  validates :name, uniqueness: true

  has_many :messages, dependent: :destroy
  has_many :user_channels

  # has_many :users, through: :messages
  has_many :users, through: :user_channels

  belongs_to :owner, :class_name => 'User'

  # def users
  #   byebug
  #   self.users.uniq
  # end
end
