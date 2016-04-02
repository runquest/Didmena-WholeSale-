class CartController < ApplicationController

  def add
    id = params[:product_id]
    quantity = params[:quantity]

    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[id] then
      cart[id] = cart[id] + quantity
    else
      cart[id] = quantity
    end
    flash[:notice] = "Item successfully added"
    redirect_to :back
    return
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