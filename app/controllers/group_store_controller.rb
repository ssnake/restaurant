class GroupStoreController < ApplicationController
  
  def index
  	@product_types = ProductType.all
  	@products_all = Product.order(:title)
  end

  def show
    @product_type = ProductType.find(params[:id])
    @product_types = ProductType.all
    @products_by_product_type = @product_type.products.order('title ASC')
  end

end
