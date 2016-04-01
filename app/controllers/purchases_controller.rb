class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create
    # logger.debug "purchase controller create"
    # logger.info "purchase controller create"
    # @order = Order.new
    # binding.pry
    # @purchase = @order.purchases.new(purchase_params)
    #     binding.pry

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




  # # GET /purchases
  # # GET /purchases.json
  # def index
  #   @purchases = Purchase.all
  # end

  # # GET /purchases/1
  # # GET /purchases/1.json
  # def show
  # end

  # # GET /purchases/new
  # def new
  #   @purchase = Purchase.new
  # end

  # # GET /purchases/1/edit
  # def edit
  # end

  # # POST /purchases
  # # POST /purchases.json
  # def create
  #   binding.pry
  #   @purchase = Purchase.new(purchase_params)

  #   respond_to do |format|
  #     if @purchase.save
  #       format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
  #       # format.json { render :show, status: :created, location: @purchase }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @purchase.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /purchases/1
  # # PATCH/PUT /purchases/1.json
  # def update
  #   respond_to do |format|
  #     if @purchase.update(purchase_params)
  #       format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @purchase }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @purchase.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /purchases/1
  # # DELETE /purchases/1.json
  # def destroy
  #   @purchase.destroy
  #   respond_to do |format|
  #     format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
