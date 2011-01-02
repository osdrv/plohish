module OversightsHelper
  def vk_user_link(user)
    return 'anonimous' if !user.kind_of? VkUser
    link_to user.name, vk_user_url(user)
  end

  def vk_user_url(user)
    return '' if !user.kind_of? VkUser
    'http://vkontakte.ru/id%d' % [user.uid]
  end

  def vk_user_avatar(user)
    if user.kind_of? VkUser
      image_tag(user.photo, :alt => user.name) if !user.photo.nil?
    end
  end
end
