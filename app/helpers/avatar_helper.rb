module AvatarHelper
  def avatar_profile(user)
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    url = "https://www.gravatar.com/#{hash}"
    call_to_action = "Change your avatar image at gravatar.com \u00BB"

    link_to call_to_action, url, target: "_blank"
  end
end
