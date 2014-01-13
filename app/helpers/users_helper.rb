module UsersHelper

  def icon(user, options = { size: 80 })
    id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{id}.png?s=#{size}"
    image_tag(url,alt: user.name,class: "icon")
  end
end
