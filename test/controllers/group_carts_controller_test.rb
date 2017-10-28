require 'test_helper'

class GroupCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get group_carts_index_url
    assert_response :success
  end

  test "should get new" do
    get group_carts_new_url
    assert_response :success
  end

  test "should get create" do
    get group_carts_create_url
    assert_response :success
  end

  test "should get show" do
    get group_carts_show_url
    assert_response :success
  end

  test "should get edit" do
    get group_carts_edit_url
    assert_response :success
  end

  test "should get update" do
    get group_carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get group_carts_destroy_url
    assert_response :success
  end

end
