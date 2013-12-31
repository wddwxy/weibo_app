module UsersHelper

  def icon(user)
    id = Digest::MD5::hexdigest(user.email.downcase)
    url = "https://secure.gravatar.com/avatar/#{id}"
    image_tag(url,alt: user.name,class: "icon")
  end
end
