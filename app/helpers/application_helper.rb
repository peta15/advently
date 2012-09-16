module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Advently"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Advently logo", :class => "round")
  end
  
 def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
end
