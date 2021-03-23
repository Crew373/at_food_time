require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get show" do
    get show_path
    assert_response :success
  end

  test "should get top" do
    get top_path
    assert_response :success
  end

  test "should post search" do
    post search_path
    assert_response :success
  end
end
