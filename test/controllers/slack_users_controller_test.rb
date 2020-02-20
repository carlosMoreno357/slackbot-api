require 'test_helper'

class SlackUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slack_user = slack_users(:one)
  end

  test "should get index" do
    get slack_users_url, as: :json
    assert_response :success
  end

  test "should create slack_user" do
    assert_difference('SlackUser.count') do
      post slack_users_url, params: { slack_user: { points: @slack_user.points, username: @slack_user.username } }, as: :json
    end

    assert_response 201
  end

  test "should show slack_user" do
    get slack_user_url(@slack_user), as: :json
    assert_response :success
  end

  test "should update slack_user" do
    patch slack_user_url(@slack_user), params: { slack_user: { points: @slack_user.points, username: @slack_user.username } }, as: :json
    assert_response 200
  end

  test "should destroy slack_user" do
    assert_difference('SlackUser.count', -1) do
      delete slack_user_url(@slack_user), as: :json
    end

    assert_response 204
  end
end
