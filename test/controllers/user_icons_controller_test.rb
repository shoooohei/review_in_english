require 'test_helper'

class UserIconsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_icons_edit_url
    assert_response :success
  end

end
