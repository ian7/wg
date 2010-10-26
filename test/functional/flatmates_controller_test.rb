require 'test_helper'

class FlatmatesControllerTest < ActionController::TestCase
  setup do
    @flatmate = flatmates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flatmates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flatmate" do
    assert_difference('Flatmate.count') do
      post :create, :flatmate => @flatmate.attributes
    end

    assert_redirected_to flatmate_path(assigns(:flatmate))
  end

  test "should show flatmate" do
    get :show, :id => @flatmate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flatmate.to_param
    assert_response :success
  end

  test "should update flatmate" do
    put :update, :id => @flatmate.to_param, :flatmate => @flatmate.attributes
    assert_redirected_to flatmate_path(assigns(:flatmate))
  end

  test "should destroy flatmate" do
    assert_difference('Flatmate.count', -1) do
      delete :destroy, :id => @flatmate.to_param
    end

    assert_redirected_to flatmates_path
  end
end
