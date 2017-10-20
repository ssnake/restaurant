class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]

  
  def index
    @products = Product.all
  end

  
  def new
    @product_type = ProductType.find(params[:product_type_id])
  end


  def create

    @product_type = ProductType.find(params[:product_type_id])
    @new_product = @product_type.products.build(product_params)
    @new_product.save
    redirect_to product_type_path(id: @product_type.id), notice: @new_product.inspect
    #@product = Product.new(product_params)

    #respond_to do |format|
    #  if @product.save
    #    format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #    format.json { render :show, status: :created, location: @product }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @product.errors, status: :unprocessable_entity }
    #  end
    #end
  end




  # GET /products/1
  # GET /products/1.json
  def show
  end


  # GET /products/1/edit
  def edit
  end



  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
