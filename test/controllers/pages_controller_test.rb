require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get portfolio" do
    get pages_portfolio_url
    assert_response :success
  end

  test "should get connections" do
    get pages_connections_url
    assert_response :success
  end

  test "should get updates" do
    get pages_updates_url
    assert_response :success
  end

end
