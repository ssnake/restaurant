require 'test_helper'

class GroupLineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_line_item = group_line_items(:one)
  end

  test "should get index" do
    get group_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_group_line_item_url
    assert_response :success
  end

  test "should create group_line_item" do
    assert_difference('GroupLineItem.count') do
      post group_line_items_url, params: { group_line_item: { group_cart_id: @group_line_item.group_cart_id, product_id: @group_line_item.product_id } }
    end

    assert_redirected_to group_line_item_url(GroupLineItem.last)
  end

  test "should show group_line_item" do
    get group_line_item_url(@group_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_line_item_url(@group_line_item)
    assert_response :success
  end

  test "should update group_line_item" do
    patch group_line_item_url(@group_line_item), params: { group_line_item: { group_cart_id: @group_line_item.group_cart_id, product_id: @group_line_item.product_id } }
    assert_redirected_to group_line_item_url(@group_line_item)
  end

  test "should destroy group_line_item" do
    assert_difference('GroupLineItem.count', -1) do
      delete group_line_item_url(@group_line_item)
    end

    assert_redirected_to group_line_items_url
  end
end
