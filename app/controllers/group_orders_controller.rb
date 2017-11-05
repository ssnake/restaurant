class GroupOrdersController < ApplicationController
  # устанавливаем корзину через модуль CurrentCart
  include CurrentCart
  before_action :set_current_group #, except: [:destroy]
  before_action :set_group_cart #, except: [:destroy]
  before_action :set_group_order, only: [:show, :edit, :update, :destroy]

  
  def index
    # отбираем группы, в которых состоит данный юзер
    @groups = Member.joins(:group).where(user_id: current_user.id)

  end

  # просмотр корзины юзером
  def show
    # если передан параметр 'by_user' то 
    # получаем коллекцию для просмотра и детализации по юзерам
    if params[:how_to_view] == 'by_user'
      @pull_users = set_pull_users(@group_order.group_line_items)
    else
      @group_order_menu = GroupLineItem.where(group_order_id: @group_order.id)
      set_dish_collection
    end
  end

  # создание нового заказа (в случае если заказ пустой то не даем его создавать)
  def new
    if @group_cart.group_line_items.empty?
      redirect_to group_store_index_url, alert: 'Нельзя создавать пустой заказ, купите же что нибудь!'
      return
    end
    # перед оформлением заказа создаем пустой экземпляр
    @group_order = GroupOrder.new
  end

  def edit
  end

  # создание заказа
  def create
    # получаем параметры
    @group_order = GroupOrder.new(group_order_params)
    # устанавливаем аттрибуты группы
    @group_order.set_order_attr(@group)
    # устанавливаем общую стоимость заказа
    @group_order.set_price(@group_cart)
    # если заказ сохранен
    if @group_order.save
      # в соединительной таблице GroupLineItems стираем id корзины
      # и назначаем id группового заказа для каждой позиции
      set_group_order_id_and_drop_group_cart_id
      # после обновления таблицы в БД удаляем ненужную корзину покупок
      GroupCart.destroy(@group_cart.id)
      redirect_to group_order_path(id: @group_order.id), notice: 'Спасибо за Ваш заказ!'
    else
      render 'new', alert: 'Заказ не создан, что то пошло не так!'
    end

  end


  private
  # установить групповой заказ
  def set_group_order
    @group_order = GroupOrder.find(params[:id])
  end

  # получение параметров заказа из белого списка
  def group_order_params
    params.require(:group_order).permit(:notice, :pay_type)
  end

  # в соединительной таблице GroupLineItems стираем id корзины
  # и назначаем id группового заказа для каждой позиции
  def set_group_order_id_and_drop_group_cart_id
    item = GroupLineItem.where(group_cart_id: @group_cart.id)
    item.update_all(group_order_id: @group_order.id, group_cart_id: nil)
  end


  # устанавливаем коллекцию блюд для просмотра позиций заказанных товаров
  def set_dish_collection
    @group_dishes = []
    dish_hash = GroupLineItem.where(group_order_id: @group_order.id).group(:product_id).sum(:quantity)
    dish_hash.keys.each do |key|
      product = Product.find(key)
      quantity = dish_hash[key]
      @group_dishes << {product: product, quantity: quantity}
    end
  end

  
  # устанавливаем список юзеров для группировки и просмотра заказа по заказчикам(юзерам)
  def set_pull_users(group_line_items)
    pull_users = []
    group_line_items.each do |item|
      pull_users << item.user
    end
    pull_users.uniq
  end

end

