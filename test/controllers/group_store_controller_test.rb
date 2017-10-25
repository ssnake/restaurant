require 'test_helper'

class GroupStoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_store_index_url
    assert_response :success
  end

  test "should get show" do
    get group_store_show_url
    assert_response :success
  end

end
