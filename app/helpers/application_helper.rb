module ApplicationHelper

  # хелпер для иконок font-awesome
  def fa_icon
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
  
end
