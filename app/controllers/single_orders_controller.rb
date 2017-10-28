class SingleOrdersController < ApplicationController
  def index
  	@single_orders = Order.all.order('created_at ASC')
  	set_line_items
  end

  def show
  	@single_order = Order.find(params[:id])
  	@line_items = LineItem.where(order_id: @single_order.id)
  end

  def destroy
  end

  private

  def set_line_items
  	@line_item = []
  	@single_orders.each do |order|
  	  @line_item << LineItem.where(order_id: order.id)
    end
  end
end
