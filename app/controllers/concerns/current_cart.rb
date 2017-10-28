module CurrentCart

  # пишем вспомогательный модуль по установке корзины 
  # для использования его в контроллере
  extended ActiveSupport::Concern

  private

  # устанавливаем текущую корзину юзера
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


  # устанавливаем метод обнаружения групповой корзины
  def set_group_cart
    if user_signed_in? == true
      if @group.group_cart != nil
        @group_cart = GroupCart.find(@group.group_cart.id)
      else 
        @group_cart = GroupCart.new
        @group_cart.group_id = @group.id
        @group_cart.save
      end
    end
  end

  def set_current_group
    @group = Group.find(params[:group_id])
  end

 
end
