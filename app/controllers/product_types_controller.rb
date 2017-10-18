class ProductTypesController < ApplicationController
  
  def index
  	@product_types = ProductType.all
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


  private

  def product_type_params
  	params.require(:product_type).permit(:title)
  end

end
