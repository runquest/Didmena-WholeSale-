require 'test_helper'

class ModelPicturesControllerTest < ActionController::TestCase
  setup do
    @model_picture = model_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_picture" do
    assert_difference('ModelPicture.count') do
      post :create, model_picture: { model_id: @model_picture.model_id, picture: @model_picture.picture }
    end

    assert_redirected_to model_picture_path(assigns(:model_picture))
  end

  test "should show model_picture" do
    get :show, id: @model_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_picture
    assert_response :success
  end

  test "should update model_picture" do
    patch :update, id: @model_picture, model_picture: { model_id: @model_picture.model_id, picture: @model_picture.picture }
    assert_redirected_to model_picture_path(assigns(:model_picture))
  end

  test "should destroy model_picture" do
    assert_difference('ModelPicture.count', -1) do
      delete :destroy, id: @model_picture
    end

    assert_redirected_to model_pictures_path
  end
end
