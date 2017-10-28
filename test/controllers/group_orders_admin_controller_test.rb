require 'test_helper'

class GroupOrdersAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_orders_admin_index_url
    assert_response :success
  end

  test "should get show" do
    get group_orders_admin_show_url
    assert_response :success
  end

  test "should get delete" do
    get group_orders_admin_delete_url
    assert_response :success
  end

end
