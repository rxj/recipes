require 'test_helper'

class GlosentriesControllerTest < ActionController::TestCase
  setup do
    @glosentry = glosentries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glosentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glosentry" do
    assert_difference('Glosentry.count') do
      post :create, glosentry: { explanation: @glosentry.explanation, keyword: @glosentry.keyword }
    end

    assert_redirected_to glosentry_path(assigns(:glosentry))
  end

  test "should show glosentry" do
    get :show, id: @glosentry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glosentry
    assert_response :success
  end

  test "should update glosentry" do
    put :update, id: @glosentry, glosentry: { explanation: @glosentry.explanation, keyword: @glosentry.keyword }
    assert_redirected_to glosentry_path(assigns(:glosentry))
  end

  test "should destroy glosentry" do
    assert_difference('Glosentry.count', -1) do
      delete :destroy, id: @glosentry
    end

    assert_redirected_to glosentries_path
  end
end
