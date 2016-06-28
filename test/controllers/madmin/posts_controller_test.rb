require 'test_helper'

class Madmin::PostsControllerTest < ActionController::TestCase
  setup do
    @madmin_post = madmin_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:madmin_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create madmin_post" do
    assert_difference('Madmin::Post.count') do
      post :create, madmin_post: {  }
    end

    assert_redirected_to madmin_post_path(assigns(:madmin_post))
  end

  test "should show madmin_post" do
    get :show, id: @madmin_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @madmin_post
    assert_response :success
  end

  test "should update madmin_post" do
    patch :update, id: @madmin_post, madmin_post: {  }
    assert_redirected_to madmin_post_path(assigns(:madmin_post))
  end

  test "should destroy madmin_post" do
    assert_difference('Madmin::Post.count', -1) do
      delete :destroy, id: @madmin_post
    end

    assert_redirected_to madmin_posts_path
  end
end
