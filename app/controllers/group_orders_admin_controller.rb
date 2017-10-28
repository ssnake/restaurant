class GroupOrdersAdminController < ApplicationController
  def index
  	@group_orders = GroupOrder.all.order("created_at ASC")
  end

  def show
  	@group_order = GroupOrder.find(params[:id])
  	@group_line_items = @group_order.group_line_items
    set_pull_users
  end

  def dish
  end

  def delete
  end

  private

  def set_pull_users
  	@pull_users = []
  	@group_line_items.each do |item|
  	  @pull_users << item.user
  	end
  	@pull_users.uniq
  end
end
