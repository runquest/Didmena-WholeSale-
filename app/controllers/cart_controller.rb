class CartController < ApplicationController

  def add
    @items = params[:_json]

    @items.each do |item|

      id = item[:product_id]
      quantity = item[:quantity]

      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end

      if cart[id] then
        cart[id] = cart[id].to_i + quantity.to_i
      else
        cart[id] = quantity
      end
    end
    redirect_to "/cart"
  end

  def destroy
    id = params[:product_id]
    cart = session[:cart]
    cart.delete(id)
    redirect_to :back, notice: t('.notice')
  end

  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    @company = Company.find(current_user.company_id)

    if session[:cart] then
      @cart = session[:cart]
      @cart_total_cost = 0
      @cart.each do |item|
        product = Product.find(item[0])
        model = Model.find(product.model_id)

        price = model.price
        quantity = item[1].to_i

        product_cost = price * quantity
        @cart_total_cost += product_cost
      end
    else
      @cart = {}
    end
  end

end