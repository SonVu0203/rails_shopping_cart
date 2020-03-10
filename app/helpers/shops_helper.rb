module ShopsHelper

  def gravatar_for(shop, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(shop.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: shop.name, class: "gravatar")
  end

end
