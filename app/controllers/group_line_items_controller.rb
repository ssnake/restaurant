class GroupLineItemsController < ApplicationController
  include CurrentCart
  before_action :set_current_group
  before_action :set_group_cart

  before_action :set_group_line_item, only: [:show, :edit, :update, :destroy]


  def index
    @group_line_items = GroupLineItem.all
  end


  def show
  end


  def new
    @group_line_item = GroupLineItem.new
  end


  def edit
  end


  def create
    product = Product.find(params[:product_id])
    @group_line_item = @group_cart.add_product(product.id)
    
    @group_line_item.save
    redirect_to group_cart_path(id: @group_cart.id), notice: 'Блюдо добавлено в предзаказ (корзину)'
       
  end


  def update
    @group_line_item.quantity = group_line_item_quantity_params
    @group_line_item.update
    redirect_to @group_line_item.group_cart, notice: 'Количество обновлено' 
  end


  def destroy
    @group_line_item.destroy
    respond_to do |format|
      format.html { redirect_to @group_line_item.group_cart, notice: 'Блюдо удалено из заказа' }
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

    def group_line_item_quantity_params
      params.require(:group_line_item).permit(:quantity)
    end


end
