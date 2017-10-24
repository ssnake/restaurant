module CurrentCart

  # пишем вспомогательный модуль по установке корзины 
  # для использования его в контроллере
  extended ActiveSupport::Concern

  private

  # устанавливаем текущую корзину 
  def set_cart

      if user_signed_in? == true
        if current_user.cart != nil
          @cart = current_user.cart
        else
          @cart = Cart.new
          @cart.user_id = current_user.id
          @cart.save
        end
      end
 
  end



    # устанавливаем корзину по сессии
  	#@cart = Cart.find(session[:cart_id])
  # если корзина не установлена то создаем ее
  #rescue ActiveRecord::RecordNotFound
  	#@cart = Cart.create
  	#session[:cart_id] = @cart.id
end
