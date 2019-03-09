class User < ApplicationRecord
  include ErrorHandling
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :messages
  has_many :user_channels

  belongs_to :team

  # has_many :channels, through: :messages
  has_many :channels, through: :user_channels
  has_many :owned_channels, :class_name => 'Channel', :foreign_key => 'owner_id'


# Break this out into Channels and DMs, will have to handle when other Users come online
  def channel_data_for_channel_list
    self.channels.collect{ |channel| {name: channel.name, slug: channel.slug, message_count: channel.messages.length } }
  end

  def last_seen_channel
    last_channel_obj = Hash.new
    sorted_channels = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}
    if sorted_channels.blank?
      last_channel_obj[:slug] = last_channel_obj[:name] = ""
      last_channel_obj[:messages] = Array.new
    else
      byebug
      last_channel = sorted_channels.last
      last_channel_obj[:slug] = last_channel.slug
      last_channel_obj[:messages] = last_channel.messages
      last_channel_obj[:name] = last_channel.name
    end
    last_channel_obj
  end

end
