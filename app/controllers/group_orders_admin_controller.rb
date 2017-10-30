class GroupOrdersAdminController < ApplicationController
  def index
  	@group_orders = GroupOrder.all.order("created_at ASC")
  end

  def show
  	@group_order = GroupOrder.find(params[:id])
  	@pull_users = set_pull_users(@group_order.group_line_items)
  end

  def dish
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
end
