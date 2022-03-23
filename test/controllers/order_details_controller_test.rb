require "test_helper"

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_details_create_url
    assert_response :success
  end

  test "should get index" do
    get order_details_index_url
    assert_response :success
  end

  test "should get show" do
    get order_details_show_url
    assert_response :success
  end
end
