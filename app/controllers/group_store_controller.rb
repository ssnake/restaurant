class GroupStoreController < ApplicationController
  # меню групповых покупок
  # перед экшеном устанавливаем текущую группу и групповую корзину
	include CurrentCart
  before_action :set_current_group
  before_action :set_group_cart
	before_action :set_product_types

  before_action :set_quantity_and_price

  # выбрать все типы продуктов
  def index
  	@products_all = Product.order(:title)
  end


  def show
    # выбор типа продукта по запрошенному id
    @product_type = ProductType.find(params[:id])
    # выбор перечня продуктов по типу продукта
    @products_by_product_type = @product_type.products.order('title ASC')
  end


  private

  # установить все типы продуктов
  def set_product_types
    @product_types = ProductType.all
  end


end
