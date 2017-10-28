class GroupCartsController < ApplicationController
  before_action :set_group_cart

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_group_cart
    @group_cart = GroupCart.find(params[:id])
  end
end
