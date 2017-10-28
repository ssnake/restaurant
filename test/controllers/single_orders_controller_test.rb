require 'test_helper'

class SingleOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get single_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get single_orders_show_url
    assert_response :success
  end

  test "should get destroy" do
    get single_orders_destroy_url
    assert_response :success
  end

end
