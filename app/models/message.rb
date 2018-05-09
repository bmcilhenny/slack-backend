class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(username: username)
    end.compact
  end
end
