require 'test_helper'

class RetiresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get retires_new_url
    assert_response :success
  end

end
