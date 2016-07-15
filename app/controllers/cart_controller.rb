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

# find all the module names
    @ordered_models = Array.new;
    @ordered_products = Array.new
    @sizes = Domain.where(domain_name: "SIZE");
    @model_products = Hash.new


    if session[:cart] then
      @cart = session[:cart]
      @cart_total_cost = 0
      @cart.each do |item|
        product = Product.find(item[0])
        quantity = item[1]
        model = Model.find(product.model_id)

        order_item = {"model_id" => product.model_id, "color_id" => product.color_id, "quantity" => quantity, "product" => product}
        @ordered_products.push(order_item)
        price = model.price
        quantity = item[1].to_i

        product_cost = price * quantity
        @cart_total_cost += product_cost
      end
    else
      @cart = {}
    end

    @models_array = Array.new
    @ordered_products.each do |op|
      if !@models_array.include? op["model_id"]
        @models_array.push(op["model_id"])
      end
    end

    # find all the products in module
    @models_array_with_hashes = Array.new
    @color_product_hash = Hash.new

    @models_array.each do |model_id|

      model_products_array = 
      @ordered_products.select { |num|  num["model_id"] == model_id  }

      model_colors = model_products_array.uniq{|x| x["color_id"] }
      
      model_colors.each do |mc|
        model_color_array = model_products_array.select { |m| m["color_id"] == mc["color_id"] }
        color_product = { mc["color_id"] => model_color_array}
        @color_product_hash[mc["model_id"]] = color_product
      end      

    end
  end
end
