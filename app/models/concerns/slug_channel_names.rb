module SlugChannelNames

  def slugify
    slug = self.name ? name : generate_dm_channel_name
    slug.downcase.strip.gsub(/[^0-9a-z]/i, '%20')
  end

  def generate_dm_channel_name
    dm_user_names = self.users.collect{|user| user.display_name}
  end

  def save_slug
    self.slug = slugify
  end

end
