require 'test_helper'

class Admins::SakePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_sake_posts_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_sake_posts_edit_url
    assert_response :success
  end

end
