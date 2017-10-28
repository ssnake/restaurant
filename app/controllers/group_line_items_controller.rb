class GroupLineItemsController < ApplicationController
  include CurrentCart
  before_action :set_current_group, except: [:update] # exceptions solved problems with update
  before_action :set_group_cart, except: [:update] # exceptions solved problems with update

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
    @group_line_item.update(group_line_item_quantity_params)
    
    redirect_to group_cart_path(group_id: @group_line_item.group_cart.group_id, 
      id: @group_line_item.id), notice: 'Количество обновлено' 
  end


  def destroy
    @group_line_item.destroy
    redirect_to group_cart_path(id: @group_cart.id), notice: 'Блюдо удалено из заказа'
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
