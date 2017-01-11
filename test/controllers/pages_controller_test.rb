require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get portfolio" do
    get portfolio_path
    assert_response :success
  end

  test "should get connections" do
    get connections_path
    assert_response :success
  end

end
