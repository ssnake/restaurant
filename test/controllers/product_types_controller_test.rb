require 'test_helper'

class ProductTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_types_index_url
    assert_response :success
  end

  test "should get new" do
    get product_types_new_url
    assert_response :success
  end

  test "should get show" do
    get product_types_show_url
    assert_response :success
  end

end
