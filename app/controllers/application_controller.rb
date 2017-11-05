class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  # описание параметров входа и регистрации в системе для гема devise
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])

    devise_parameter_sanitizer.permit(:sign_up, 
    	keys: [:name, :email, :password, :password_confirmation])

  end  
  
end
