module ApplicationHelper
    # Get the gravatar picture of a user.
    # This take an user object as parameter.
    def gravatar_for user, options = { size: 200 }
        userEmail = user[:email].strip.downcase
        size = options[:size]
        gravatar_id = Digest::MD5::hexdigest(userEmail)
        gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end
