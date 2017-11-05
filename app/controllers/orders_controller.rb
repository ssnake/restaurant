class OrdersController < ApplicationController
  # устанавливаем корзину
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  
  # получаем список всех заказов
  def index
    @orders = Order.where(name: current_user.name)
  end

  
  def show
  end

  # создаем новый заказ
  def new
    # выбиваем ошибку при попытке создать заказ с пустой корзиной
    if @cart.line_items.empty?
      redirect_to root_path, alert: 'Нельзя создавать заказ с пустой корзиной, купите же что нибудь!'
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # сохранение оформленого заказа
  def create
    @order = Order.new(order_params)
    # устанавливаем имя и емаил из юзера
    @order.set_order_attr(current_user)
    # подбиваем тотал стоимости, все данные из бд дергаем через id корзины
    @order.set_price(@cart)
    
    if @order.save
      # если заказ сохранен то выполнить метод для перестройки соединительной
      # таблицы LineItem
      set_order_id_and_drop_cart_id
      # удаляем ненужную корзину
      Cart.destroy(@cart.id)
      redirect_to order_path(@order.id), notice: 'Спасибо за Ваш заказ!' 
    else 
      redirect_to cart_path(id: @cart.id), alert: 'Заказ не отправлен, что то пошло не так!'
    end

  end




  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # устанавливаем текущий заказ
    def set_order
      @order = Order.find(params[:id])
    end

    # получаем параметры из формы по белому списку
    def order_params
      params.require(:order).permit(:notice, :pay_type)
    end

    # форматируем таблицу LineItem - стираем id корзины на позициях товара и назначаем
    # id заказа
    def set_order_id_and_drop_cart_id
      item = LineItem.where(cart_id: @cart.id)
      item.update_all(order_id: @order.id, cart_id: nil)
    end
end
