class GroupCartsController < ApplicationController
  include CurrentCart
  before_action :set_current_group #, except: [:destroy]
  before_action :set_group_cart #, except: [:destroy]

  #before_action :set_group_cart

  #rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

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
    @group_cart.group_line_items.destroy_all
    redirect_to group_path(id: @group_cart.group_id), notice: 'Групповая корзина очищена'
  end

  private


  # выдаем исключение при неправильно указанной корзине с блюдами
  def invalid_cart
    logger.error "Попытка доступа к несуществующей корзине заказа #{params[:id]}"
    redirect_to root_path, alert: 'Некорректно указано меню предзаказа'
  end
  
end
