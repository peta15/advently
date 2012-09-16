module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
  
  def fb_thumbnail_for(user)
    fb_uid = user.uid
    fb_profile_image_url = "http://graph.facebook.com/#{fb_uid}/picture?type=square"        
    link_to image_tag(fb_profile_image_url), user
  end
  
end
