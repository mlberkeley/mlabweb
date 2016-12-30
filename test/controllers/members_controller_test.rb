require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @member = members(:david)
    @other_member = members(:fool)
  end

  test "should get new" do
    get create_path
    assert_response :success
  end

end
