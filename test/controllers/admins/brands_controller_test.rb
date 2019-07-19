require 'test_helper'

class Admins::BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_brands_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_brands_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_brands_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_brands_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_brands_update_url
    assert_response :success
  end

  test "should get change_status" do
    get admins_brands_change_status_url
    assert_response :success
  end

end
