class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create
   if session[:cart].nil? || session[:cart].empty?
      flash[:alert] = 'no items in the cart'
      redirect_to :back, alert: t('.alert')
      # redirect_to :back, notice: t('.notice')
    else
      
      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end

      @order_number = Time.now.strftime("%Y%d%m%H%M%S")

      total_purchase_price = 0

      cart.each do |item|

        product = Product.find(item[0])
        product_id = product.id
        model = Model.find(product.model_id)
        price = model.price.to_i
        quantity = item[1].to_i
        total_price = price * quantity

        total_purchase_price += total_price
      end
      @order = Order.new(order_number: @order_number, order_date: Time.now, total_price: total_purchase_price, contact: current_user.id)
      @order.save

      cart.each do |product_id, quantity|
        @purchase = Purchase.create(order_id: @order.id, product_id: product_id, quantity: quantity)
      end
      @purchases_for_order = Order.find(@order.id).purchases
      # email_confirm
      session[:cart] = nil
    end
  end

  def email_confirm
    @user = current_user
    DidmenaMailer.order_confirmation(@user, @order).deliver_now
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
