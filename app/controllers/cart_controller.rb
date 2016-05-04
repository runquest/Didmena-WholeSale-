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
    flash[:notice] = "Item successfully removed"
    redirect_to :back

  end

  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

end