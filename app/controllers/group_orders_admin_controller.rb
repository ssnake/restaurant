class GroupOrdersAdminController < ApplicationController
  def index
  	@group_orders = GroupOrder.all.order("created_at ASC")
  end

  def show
    @group_order = GroupOrder.find(params[:id])

    # если передан параметр 'by_user' то 
    # получаем коллекцию для просмотра и детализации по юзерам
    if params[:how_to_view] == 'by_user'
  	  @pull_users = set_pull_users(@group_order.group_line_items)

    # если передан параметр 'by_dish' то 
    # получаем коллекцию для просмотра и детализации блюдам
    elsif params[:how_to_view] == 'by_dish'
      @group_line_items = GroupLineItem.where(group_order_id: @group_order.id).group(:product_id)
    end
  end

  def delete
  end

  private

  def set_pull_users(group_line_items)
  	pull_users = []
  	group_line_items.each do |item|
  	  pull_users << item.user
  	end
    pull_users.uniq
  end

  def set_dish_collection
    @dish = []
    dish_hash = GroupLineItem.where(group_order_id: @group_order.id).group(:product_id).sum(:quantity)
    dish_hash.keys.each do |key|
      product = Product.find(key)
      quantity = dish_hash[key]
      @dish << [product, quantity]
    end
  end

end
