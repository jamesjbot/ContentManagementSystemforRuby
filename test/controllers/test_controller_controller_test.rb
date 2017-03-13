require 'test_helper'

class TestControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get open" do
    get test_controller_open_url
    assert_response :success
  end

  test "should get close" do
    get test_controller_close_url
    assert_response :success
  end

  test "should get edit" do
    get test_controller_edit_url
    assert_response :success
  end

end
