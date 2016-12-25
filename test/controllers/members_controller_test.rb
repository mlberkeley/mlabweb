require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_path
    assert_response :success
  end

end
