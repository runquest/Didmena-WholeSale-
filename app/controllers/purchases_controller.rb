class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create

    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    @order_number = (0..8).map {(65 + rand(26)).chr}.join

    @order = Order.new(order_number: @order_number, order_date: Time.now, representative_id: current_user.id)
    @order.save

    cart.each do |product_id, quantity|
      @purchase = Purchase.create(order_id: @order.id, product_id: product_id, quantity: quantity)
      @purchase.save
    end

    @purchases_for_order = Purchase.where(order_id: @order.id)
    session[:cart] = nil
  end

  # def update
  #   @order = current_order
  #   @purchase = @order.purchases.find(params[:id])
  #   @purchase.update_attributes(purchase_params)
  #   @purchases = @order.purchases
  # end

  # def destroy
  #   @order = current_order
  #   @purchase = @order.purchases.find(params[:id])
  #   @purchase.destroy
  #   @purchases = @order.purchases
  # end
# private
#   def purchase_params
#     params.require(:purchase).permit(:quantity, :product_id)
#   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:order_id, :product_id, :quantity, :note)
    end
end
