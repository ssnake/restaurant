require 'test_helper'

class GroupOrdersAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dish" do
    get group_orders_admin_dish_url
    assert_response :success
  end

end
