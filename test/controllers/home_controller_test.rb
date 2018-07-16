require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get members" do
    get home_members_url
    assert_response :success
  end

  test "should get recruit" do
    get home_recruit_url
    assert_response :success
  end

end
