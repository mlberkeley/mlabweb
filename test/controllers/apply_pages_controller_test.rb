require 'test_helper'

class ApplyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get member" do
    get apply_pages_member_url
    assert_response :success
  end

  test "should get client" do
    get apply_pages_client_url
    assert_response :success
  end

end
