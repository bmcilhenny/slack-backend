class Channel < ApplicationRecord
  include SlugChannelNames
  include ErrorHandling

  validates :name, uniqueness: true

  has_many :messages, dependent: :destroy
  has_many :user_channels
  has_many :users, through: :user_channels

  belongs_to :team
  belongs_to :owner, :class_name => 'User'

  before_save :save_slug

end
