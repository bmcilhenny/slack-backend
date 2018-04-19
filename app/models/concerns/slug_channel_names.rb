module SlugChannelNames

  def slugify
    slug = self.name ? name : generate_dm_channel_name
    slug.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
  end

  def generate_dm_channel_name
    dm_user_names = self.users.collect{|user| user.display_name}
    dm_user_names.join(' ')
  end

  def save_slug
    self.slug = slugify
  end

end
