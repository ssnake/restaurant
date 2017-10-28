class GroupCartsController < ApplicationController
  before_action :set_group_cart

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
  end

  private

  def set_group_cart
    @group_cart = GroupCart.find(params[:id])
  end

  # выдаем исключение при неправильно указанной корзине с блюдами
  def invalid_cart
    logger.error "Попытка доступа к несуществующей корзине заказа #{params[:id]}"
    redirect_to root_path, alert: 'Некорректно указано меню предзаказа'
  end
  
end
