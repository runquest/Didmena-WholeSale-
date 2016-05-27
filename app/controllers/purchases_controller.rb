class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create

    total_quantity = params[:total_quantity]
    if total_quantity.to_i < 1 then
      flash[:alert] = 'no items in the cart'
      redirect_to :back
    end
    
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    @order_number = Time.now.strftime("%Y%d%m%H%M%S")

    @order = Order.new(order_number: @order_number, order_date: Time.now, representative_id: current_user.id)
    @order.save

    cart.each do |product_id, quantity, total_quantity|
      @purchase = Purchase.create(order_id: @order.id, product_id: product_id, quantity: quantity)
    end

    @purchases_for_order = Order.find(@order.id).purchases
    Notifier.welcome_email.deliver_now
    session[:cart] = nil
    redirect_to root_path
  end

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
