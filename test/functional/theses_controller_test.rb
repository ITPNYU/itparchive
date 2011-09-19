require 'test_helper'

class ThesesControllerTest < ActionController::TestCase
  setup do
    @thesis = theses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thesis" do
    assert_difference('Thesis.count') do
      post :create, thesis: @thesis.attributes
    end

    assert_redirected_to thesis_path(assigns(:thesis))
  end

  test "should show thesis" do
    get :show, id: @thesis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thesis.to_param
    assert_response :success
  end

  test "should update thesis" do
    put :update, id: @thesis.to_param, thesis: @thesis.attributes
    assert_redirected_to thesis_path(assigns(:thesis))
  end

  test "should destroy thesis" do
    assert_difference('Thesis.count', -1) do
      delete :destroy, id: @thesis.to_param
    end

    assert_redirected_to theses_path
  end
end
