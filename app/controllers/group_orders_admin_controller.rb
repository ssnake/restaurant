class GroupOrdersAdminController < ApplicationController
  def index
  	@group_orders = GroupOrder.all.order("created_at ASC")
  end

  def show
  end

  def delete
  end
end
