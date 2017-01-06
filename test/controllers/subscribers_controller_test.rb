require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscribe_path
    assert_response :success
  end

end
