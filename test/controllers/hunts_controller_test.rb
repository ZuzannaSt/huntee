require 'test_helper'

class HuntsControllerTest < ActionController::TestCase

  setup do
    @hunt = hunts(:looser)
    @winner = hunts(:winner)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hunts)
    assert_not_nil assigns(:hash)
  end

  test "index should render correct layout" do
    get :index
    assert_template layout: "layouts/application"
    assert_template partial: "_scripts"
    assert_template partial: "_map"
  end

  test "should create hunt" do
    skip_setting_hunt
    json = { hunt: { email: @hunt.email, latitude: @hunt.latitude, longitude: @hunt.longitude }}.to_json
    post :create, json
  end

  test "should return error on creating" do
    skip_setting_hunt
    json = { hunt: { email: nil }}.to_json
    post :create, json
    assert_response 500, @response
  end
end
