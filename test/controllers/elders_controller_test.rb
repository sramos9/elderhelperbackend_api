require 'test_helper'

class EldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elder = elders(:one)
  end

  test "should get index" do
    get elders_url, as: :json
    assert_response :success
  end

  test "should create elder" do
    assert_difference('Elder.count') do
      post elders_url, params: { elder: { date_needed: @elder.date_needed, details: @elder.details, duration: @elder.duration, email: @elder.email, location: @elder.location, name: @elder.name, phone: @elder.phone, title: @elder.title } }, as: :json
    end

    assert_response 201
  end

  test "should show elder" do
    get elder_url(@elder), as: :json
    assert_response :success
  end

  test "should update elder" do
    patch elder_url(@elder), params: { elder: { date_needed: @elder.date_needed, details: @elder.details, duration: @elder.duration, email: @elder.email, location: @elder.location, name: @elder.name, phone: @elder.phone, title: @elder.title } }, as: :json
    assert_response 200
  end

  test "should destroy elder" do
    assert_difference('Elder.count', -1) do
      delete elder_url(@elder), as: :json
    end

    assert_response 204
  end
end
