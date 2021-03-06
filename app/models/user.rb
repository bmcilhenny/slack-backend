class User < ApplicationRecord
  include ErrorHandling
  has_secure_password

  validates :username, presence: true
  # validates :password, presence: true
  validates :username, uniqueness: true

  has_many :messages
  has_many :user_channels

  belongs_to :team

  # has_many :channels, through: :messages
  has_many :channels, through: :user_channels
  has_many :owned_channels, :class_name => 'Channel', :foreign_key => 'owner_id'

  def channel_data_for_channel_list
    self.channels.collect{ |channel| {name: channel.name, slug: channel.slug, message_count: channel.messages.length } }
  end

  def channel_slugs
  end

end
