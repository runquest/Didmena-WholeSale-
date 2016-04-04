require 'test_helper'

class OrderProductsControllerTest < ActionController::TestCase
  setup do
    @order_product = order_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_product" do
    assert_difference('OrderProduct.count') do
      post :create, order_product: { note: @order_product.note, order_id: @order_product.order_id, product_id: @order_product.product_id, quantity: @order_product.quantity }
    end

    assert_redirected_to order_product_path(assigns(:order_product))
  end

  test "should show order_product" do
    get :show, id: @order_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_product
    assert_response :success
  end

  test "should update order_product" do
    patch :update, id: @order_product, order_product: { note: @order_product.note, order_id: @order_product.order_id, product_id: @order_product.product_id, quantity: @order_product.quantity }
    assert_redirected_to order_product_path(assigns(:order_product))
  end

  test "should destroy order_product" do
    assert_difference('OrderProduct.count', -1) do
      delete :destroy, id: @order_product
    end

    assert_redirected_to order_products_path
  end
end
