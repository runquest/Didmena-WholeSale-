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
    # @ordered_models = Array.new;
    # @ordered_products = Array.new
    @ordered_items = Array.new
    @sizes = Domain.where(domain_name: "SIZE");

    # lentele atsikirai kiekvienam modeliui

    # eilute butu spalva
    # stulpelis butu dydis
    # lastele butu kiekis

    # parametrai:
    # {"12" => "100", "34" => "10"}
    # {"produkto_id" => "kiekis"}


# binding.pry
    
    # {modelio_id => {product1, productas2, productas3}}
    @model_products = Hash.new


    if session[:cart] then
      @cart = session[:cart]
      @cart_total_cost = 0
      
      #per krepseli
      @cart.each do |item|
        product = Product.find(item[0])
        # quantity = item[1]

        model = Model.find(product.model_id)
        color = Domain.find(product.color_id)
        size = Domain.find(product.size_id)

        # order_item = {"model_id" => product.model_id, "color_id" => product.color_id, "quantity" => quantity, "product" => product}
        order_item = {"model" => model, "color" => color, "size" => size, "quantity" => item[1]}
        # binding.pry
        @ordered_items.push(order_item)
        # @ordered_products.push(order_item)
        price = model.price
        quantity = item[1].to_i

        product_cost = price * quantity
        @cart_total_cost += product_cost
      end
    else
      @cart = {}
    end

    all_models = @ordered_items.collect { |x| x["model"].title }
    # all_models = @ordered_items.collect { |x| x["model"] }
    @diff_models = all_models.uniq
    # binding.pry

    model_items = @ordered_items.select { |x| x["model"].id == 1 }
    all_model_colors = model_items.collect { |x| x["color"].id }
    diff_model_colors = all_model_colors.uniq
    # binding.pry

    answers = Array.new
    # answer_lines = Array.new

    diff_model_colors.each do |model_color|
      model_color_items = model_items.select { |x| x["color"].id ==  model_color }
      # binding.pry
      answer_lines = Array.new

      answer_lines.push(model_color)
      @sizes.each do |s|
        # binding.pry
        q = "0"
        model_color_items.each do |item|
          if item["size"].id == s.id
            q = item["quantity"]
            break
          end
        end

        answer_lines.push(q)
          # if model_color_items["size"].id == s.id
          # # if model_color_items.first["size"].id == s.id
          #   # binding.pry
          #   answer_lines.push(model_color_items.first["quantity"])
          # else
          #   answer_lines.push("0")
          # end
        # end
      end
      answers.push(answer_lines)
    end

    binding.pry


    models = @ordered_items.uniq { |item| item.first } 
    # binding.pry
    @unique_models_array = Array.new
    @unique_colors_array = Array.new

    models.each do |model_uniq|
      @unique_models_array.push(model_uniq["model"])
      @unique_colors_array.push(model_uniq["colors"])
    end



    # binding.pry
    
    # # ordered_items
    # # model_titles
  


    # # Kokie yra modeliai uzsakyme
    # @models_array = Array.new
    # @ordered_products.each do |op|
    #   if !@models_array.include? op["model_id"]
    #     @models_array.push(op["model_id"])
    #   end
    # end

    # # find all the products in module
    # @models_array_with_hashes = Array.new
    # @color_product_hash = Hash.new


    # @models_array.each do |model_id|

    #   model_products_array = @ordered_products.select { 
    #     |num|  num["model_id"] == model_id  
    #   }

    #   # isrenku visas spalvas tame modelyje
    #   model_colors = model_products_array.uniq{|x| x["color_id"] }
    #         # binding.pry

    #   model_colors.each do |mc|
    #     model_color_array = model_products_array.select { |m| m["color_id"] == mc["color_id"] }
    #     color_product = { mc["color_id"] => model_color_array}
    #     @color_product_hash[mc["model_id"]] = color_product
    #   end      
      # binding.pry
    # end
  end
end
