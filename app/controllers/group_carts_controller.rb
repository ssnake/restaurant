class GroupCartsController < ApplicationController
  include CurrentCart
  before_action :set_current_group
  before_action :set_group_cart

  #before_action :set_group_cart

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    if @group_cart.group.user.id == current_user.id
      @group_cart.destroy
      session[:group_cart_id] = nil
      redirect_to group_path(id: @group.id), notice: 'Групповая корзина очищена'
    else
      render :show, alert: 'У вас нет прав на очистку корзины т. к. Вы не являетесь создателем группы'
    end
  end

  private


  # выдаем исключение при неправильно указанной корзине с блюдами
  def invalid_cart
    logger.error "Попытка доступа к несуществующей корзине заказа #{params[:id]}"
    redirect_to root_path, alert: 'Некорректно указано меню предзаказа'
  end
  
end
