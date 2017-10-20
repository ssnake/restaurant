class ProductsController < ApplicationController
  before_action :set_product_type, only: [:new, :create, :show, :edit, :update, :destroy]

  
  def index
    @products = Product.all
  end

  
  def new

  end


  def create
    @new_product = @product_type.products.build(product_params)
    if @new_product.save
      redirect_to product_type_path(id: @product_type.id), notice: 'Блюдо добавлено в меню'
    else
      render 'new', alert: 'Что то пошло не так'
    end
  end


  def show
    @product = @product_type.products.find(params[:id])
  end


  def edit
    @product = @product_type.products.find(params[:id])
  end


  def update
    @product = @product_type.products.find(params[:id])    
    if @product.update(product_params)
      redirect_to product_types_path, method: :patch, notice: 'Блюдо обновлено в меню'
    else
      render 'edit', alert: 'Что то пошло не так'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:product_type_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
