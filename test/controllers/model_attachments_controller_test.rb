require 'test_helper'

class ModelAttachmentsControllerTest < ActionController::TestCase
  setup do
    @model_attachment = model_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_attachment" do
    assert_difference('ModelAttachment.count') do
      post :create, model_attachment: { avatar: @model_attachment.avatar, model_id: @model_attachment.model_id }
    end

    assert_redirected_to model_attachment_path(assigns(:model_attachment))
  end

  test "should show model_attachment" do
    get :show, id: @model_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_attachment
    assert_response :success
  end

  test "should update model_attachment" do
    patch :update, id: @model_attachment, model_attachment: { avatar: @model_attachment.avatar, model_id: @model_attachment.model_id }
    assert_redirected_to model_attachment_path(assigns(:model_attachment))
  end

  test "should destroy model_attachment" do
    assert_difference('ModelAttachment.count', -1) do
      delete :destroy, id: @model_attachment
    end

    assert_redirected_to model_attachments_path
  end
end
