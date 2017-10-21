module ApplicationHelper

  # хелпер для иконок font-awesome
  def fa_icon
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  # проверка выполнен ли вход и является ли юзер админом
  def user_admin
  	if user_signed_in? and current_user.admin == true
  	  return true
  	end
  end

  # проверка того что пользователь выполнил вход и не является админом
  def user_login
  	if user_signed_in? and current_user.admin != true
  	  return true
  	end
  end
  
end
