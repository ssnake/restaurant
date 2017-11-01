class OrdersController < ApplicationController
  # устанавливаем корзину
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(name: current_user.name)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    #@my_order = LineItem.where(order_id: @order.id)

  end

  # GET /orders/new
  def new
    # выбиваем ошибку при попытке создать заказ с пустой корзиной
    if @cart.line_items.empty?
      redirect_to root_path, alert: 'Нельзя создавать заказ с пустой корзиной, купите же что нибудь!'
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    # устанавливаем имя и емаил из юзера
    @order.set_order_attr(current_user)
    # подбиваем тотал стоимости, все данные из бд дергаем через id корзины
    @order.set_price(@cart)
    
    if @order.save
      set_order_id_and_drop_cart_id
      Cart.destroy(@cart.id)
      redirect_to order_path(@order.id), notice: 'Спасибо за Ваш заказ!' 
    else 
      redirect_to cart_path(id: @cart.id), alert: 'Заказ не отправлен, что то пошло не так!'
    end

  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:notice, :pay_type)
    end

    def set_order_id_and_drop_cart_id
      item = LineItem.where(cart_id: @cart.id)
      item.update_all(order_id: @order.id, cart_id: nil)
    end
end
