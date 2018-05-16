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
    last_seen_channel_dup = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}.last.as_json
    last_seen_channel_slug_data_dup = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}.last.channel.slug.as_json
    last_seen_channel_messages_dup = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}.last.channel.messages.as_json

    last_seen_channel_messages_dup = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}.last.channel.messages.collect{ |message| MessageSerializer.new(message)}.as_json

    last_seen_channel_name_dup = self.user_channels.sort{ |a, b| a[:last_seen] <=> b[:last_seen]}.last.channel.name.as_json
    last_seen_channel_dup[:slug] = last_seen_channel_slug_data_dup
    last_seen_channel_dup[:messages] = last_seen_channel_messages_dup
    last_seen_channel_dup[:name] = last_seen_channel_name_dup
    last_seen_channel_dup
  end

end
