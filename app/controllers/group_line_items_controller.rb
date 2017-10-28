class GroupLineItemsController < ApplicationController
  include CurrentCart
  before_action :set_current_group
  before_action :set_group_cart

  before_action :set_group_line_item, only: [:show, :edit, :update, :destroy]

  # GET /group_line_items
  # GET /group_line_items.json
  def index
    @group_line_items = GroupLineItem.all
  end

  # GET /group_line_items/1
  # GET /group_line_items/1.json
  def show
  end

  # GET /group_line_items/new
  def new
    @group_line_item = GroupLineItem.new
  end

  # GET /group_line_items/1/edit
  def edit
  end

  # POST /group_line_items
  # POST /group_line_items.json
  def create
    product = Product.find(params[:product_id])
    @group_line_item = @group_cart.group_line_items.build(product: product)
    
    respond_to do |format|
      if @group_line_item.save
        format.html { redirect_to group_cart_path(id: @group_cart.id), 
          notice: 'Блюдо добавлено в предзаказ (корзину)' }
        format.json { render :show, status: :created, location: @group_line_item }
      else
        format.html { render :new }
        format.json { render json: @group_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_line_items/1
  # PATCH/PUT /group_line_items/1.json
  def update
    respond_to do |format|
      if @group_line_item.update(group_line_item_params)
        format.html { redirect_to @group_line_item, notice: 'Group line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_line_item }
      else
        format.html { render :edit }
        format.json { render json: @group_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_line_items/1
  # DELETE /group_line_items/1.json
  def destroy
    @group_line_item.destroy
    respond_to do |format|
      format.html { redirect_to group_line_items_url, notice: 'Group line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_line_item
      @group_line_item = GroupLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_line_item_params
      params.require(:group_line_item).permit(:product_id, :group_cart_id)
    end
end
