require 'test_helper'

class Admin::RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_region = admin_regions(:one)
  end

  test "should get index" do
    get admin_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_region_url
    assert_response :success
  end

  test "should create admin_region" do
    assert_difference('Admin::Region.count') do
      post admin_regions_url, params: { admin_region: {  } }
    end

    assert_redirected_to admin_region_url(Admin::Region.last)
  end

  test "should show admin_region" do
    get admin_region_url(@admin_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_region_url(@admin_region)
    assert_response :success
  end

  test "should update admin_region" do
    patch admin_region_url(@admin_region), params: { admin_region: {  } }
    assert_redirected_to admin_region_url(@admin_region)
  end

  test "should destroy admin_region" do
    assert_difference('Admin::Region.count', -1) do
      delete admin_region_url(@admin_region)
    end

    assert_redirected_to admin_regions_url
  end
end
