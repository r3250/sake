require 'test_helper'

class SakePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sake_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get sake_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get sake_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get sake_posts_edit_url
    assert_response :success
  end

end
