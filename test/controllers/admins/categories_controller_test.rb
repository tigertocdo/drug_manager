require 'test_helper'

class Admins::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_categories_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_categories_edit_url
    assert_response :success
  end

  test "should get change_status" do
    get admins_categories_change_status_url
    assert_response :success
  end

end
