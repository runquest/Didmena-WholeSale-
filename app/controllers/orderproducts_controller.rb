class OrderproductsController < ApplicationController
  def create
    @order = current_order
    @orderproduct = @order.orderproducts.new(orderproduct_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @orderproduct = @order.order_products.find(params[:id])
    @orderproduct.update_attributes(orderproduct_params)
    @orderproducts = @order.orderproducts
  end

  def destroy
    @order = current_order
    @orderproduct = @order.orderproducts.find(params[:id])
    @orderproduct.destroy
    @orderproducts = @order.orderproducts
  end
private
  def orderproduct_params
    params.require(:orderproduct).permit(:quantity, :model_id, :color_id, :size_id)
  end
end