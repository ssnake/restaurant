class GroupOrdersController < ApplicationController
  # устанавливаем корзину
  include CurrentCart
  before_action :set_current_group #, except: [:destroy]
  before_action :set_group_cart #, except: [:destroy]
  before_action :set_group_order, only: [:show, :edit, :update, :destroy]

  
  def index
    #@group_orders = GroupOrder.all
    # отбираем группы, в которых состоит данный юзер
    @groups = Member.joins(:group).where(user_id: current_user.id)

  end

  # GET /group_orders/1
  # GET /group_orders/1.json
  def show
    @my_group_order = GroupLineItem.where(group_order_id: @group_order.id)
  end

  # GET /group_orders/new
  def new
    if @group_cart.group_line_items.empty?
      redirect_to group_store_index_url, alert: 'Нельзя создавать пустой заказ, купите же что нибудь!'
      return
    end
    @group_order = GroupOrder.new
  end

  # GET /group_orders/1/edit
  def edit
  end

  # POST /group_orders
  # POST /group_orders.json
  def create
    @group_order = GroupOrder.new(group_order_params)
    @group_order.set_order_attr(@group)
    @group_order.set_price(@group_cart)
    if @group_order.save
      set_group_order_id_and_drop_group_cart_id
      GroupCart.destroy(@group_cart.id)
      redirect_to group_order_path(id: @group_order.id), notice: 'Спасибо за Ваш заказ!'
    else
      render 'new', alert: 'Заказ не создан, что то пошло не так!'
    end

  end

  # PATCH/PUT /group_orders/1
  # PATCH/PUT /group_orders/1.json
  def update
    respond_to do |format|
      if @group_order.update(group_order_params)
        format.html { redirect_to @group_order, notice: 'Group order was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_order }
      else
        format.html { render :edit }
        format.json { render json: @group_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_orders/1
  # DELETE /group_orders/1.json
  def destroy
    @group_order.destroy
    respond_to do |format|
      format.html { redirect_to group_orders_url, notice: 'Group order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_order
      @group_order = GroupOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_order_params
      params.require(:group_order).permit(:notice, :pay_type)
    end

    def set_group_order_id_and_drop_group_cart_id
      item = GroupLineItem.where(group_cart_id: @group_cart.id)
      item.update_all(group_order_id: @group_order.id, group_cart_id: nil)
    end
end

