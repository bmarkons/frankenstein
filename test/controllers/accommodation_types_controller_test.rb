require 'test_helper'

class AccommodationTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodation_type = accommodation_types(:one)
  end

  test "should get index" do
    get accommodation_types_url
    assert_response :success
  end

  test "should get new" do
    get new_accommodation_type_url
    assert_response :success
  end

  test "should create accommodation_type" do
    assert_difference('AccommodationType.count') do
      post accommodation_types_url, params: { accommodation_type: { name: @accommodation_type.name } }
    end

    assert_redirected_to accommodation_type_url(AccommodationType.last)
  end

  test "should show accommodation_type" do
    get accommodation_type_url(@accommodation_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_accommodation_type_url(@accommodation_type)
    assert_response :success
  end

  test "should update accommodation_type" do
    patch accommodation_type_url(@accommodation_type), params: { accommodation_type: { name: @accommodation_type.name } }
    assert_redirected_to accommodation_type_url(@accommodation_type)
  end

  test "should destroy accommodation_type" do
    assert_difference('AccommodationType.count', -1) do
      delete accommodation_type_url(@accommodation_type)
    end

    assert_redirected_to accommodation_types_url
  end
end
