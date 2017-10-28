class GroupStoreController < ApplicationController
	before_action :current_group

	include CurrentCart
    before_action :set_group_cart
	
 
  def index
  	@product_types = ProductType.all
  	@products_all = Product.order(:title)
  end

  def show
    @product_type = ProductType.find(params[:id])
    @product_types = ProductType.all
    @products_by_product_type = @product_type.products.order('title ASC')
  end

  private

  def current_group
  	@group = Group.find(params[:group_id])
  end

end
