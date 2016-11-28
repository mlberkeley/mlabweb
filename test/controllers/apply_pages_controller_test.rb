require 'test_helper'

class ApplyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get member" do
    get apply_member_path
    assert_response :success
  end

  test "should get client" do
    get apply_client_path
    assert_response :success
  end

end
