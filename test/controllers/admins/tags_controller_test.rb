require 'test_helper'

class Admins::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_tags_index_url
    assert_response :success
  end

end
