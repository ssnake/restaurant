require 'test_helper'

class GroupOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_order = group_orders(:one)
  end

  test "should get index" do
    get group_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_group_order_url
    assert_response :success
  end

  test "should create group_order" do
    assert_difference('GroupOrder.count') do
      post group_orders_url, params: { group_order: { email: @group_order.email, name: @group_order.name, notice: @group_order.notice, pay_type: @group_order.pay_type } }
    end

    assert_redirected_to group_order_url(GroupOrder.last)
  end

  test "should show group_order" do
    get group_order_url(@group_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_order_url(@group_order)
    assert_response :success
  end

  test "should update group_order" do
    patch group_order_url(@group_order), params: { group_order: { email: @group_order.email, name: @group_order.name, notice: @group_order.notice, pay_type: @group_order.pay_type } }
    assert_redirected_to group_order_url(@group_order)
  end

  test "should destroy group_order" do
    assert_difference('GroupOrder.count', -1) do
      delete group_order_url(@group_order)
    end

    assert_redirected_to group_orders_url
  end
end
