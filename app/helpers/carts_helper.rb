module CartsHelper

  extended ActiveSupport::Concern

  private

  # устанавливаем текущую корзину 
  def set_cart
  	# устанавливаем корзину по сессии
  	@cart = Cart.find(session[:cart_id])
  # если корзина не установлена то создаем ее
  rescue ActiveRecord::RecordNotFound
  	@cart = Cart.create
  	session[:cart_id] = @cart.id
  end

end
