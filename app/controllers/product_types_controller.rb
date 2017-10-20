class ProductTypesController < ApplicationController

  before_action :set_all_product_types, only: [:index, :show]
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]
  before_action :set_products_by_product_type, only: [:show]
  

  def index
  	@products_all = Product.all.order('title ASC')
  end


  def new
  	@product_type = ProductType.new
  end


  def create
  	@product_type = ProductType.new(product_type_params)
  	if @product_type.save
  	  redirect_to product_types_path, notice: 'Категория меню добавлена'
  	else
  	  render :new
  	end
  end


  def show

  end


  def edit
    
  end


  def update
    @product_type.update(product_type_params)
    redirect_to product_types_path, notice: 'Раздел меню обновлен'
  end


  def destroy
    @product_type.destroy
    redirect_to product_types_path, alert: 'Раздел меню удален'
  end


  private

  def product_type_params
  	params.require(:product_type).permit(:title)
  end

  def set_all_product_types
    @product_types = ProductType.all
  end

  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  def set_products_by_product_type
    @products_by_product_type = @product_type.products.order('title ASC')
  end

end
