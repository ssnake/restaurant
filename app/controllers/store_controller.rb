class StoreController < ApplicationController
  include CurrentCart
  before_action :set_current_or_new_cart
  def index
  	@product_types = ProductType.all
  	@products_all = Product.order(:title)
  end

  def show
    @product_type = ProductType.find(params[:id])
    @product_types = ProductType.all
    @products_by_product_type = @product_type.products.order('title ASC')
  end




      ##############
    def set_current_or_new_cart
      if user_signed_in? == true
        if current_user.cart != nil
          @cart = current_user.cart
        else
          @cart = Cart.new
          @cart.user_id = current_user.id
          @cart.save
          
          #current_user.cart.build
          #current_user.cart.save
        end
      end
    end
end
