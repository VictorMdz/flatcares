require 'test_helper'

class FlatmembersControllerTest < ActionDispatch::IntegrationTest
  test "should get invite" do
    get flatmembers_invite_url
    assert_response :success
  end

end
