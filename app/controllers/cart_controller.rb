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

    if (!current_user.company_id.nil?)
      @company = Company.find(current_user.company_id)
    end
  
    @ordered_items = Array.new
    @sizes = Domain.where(domain_name: "SIZE").order(:id).reverse

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

        order_item = {"model" => model, "color" => color, "size" => size, "quantity" => item[1]}
        @ordered_items.push(order_item)
        price = model.price
        quantity = item[1].to_i

        product_cost = price * quantity
        @cart_total_cost += product_cost
      end
    else
      @cart = {}
    end

    if !@company.nil?
      if !@company.discount.nil? && !@cart_total_cost.nil? 
        @final_cost = @cart_total_cost - @company.discount
        @final_cost = @final_cost.to_i
      end
    else 
      @final_cost = 0
    end 

    all_models = @ordered_items.collect { |x| x["model"].id }
    @diff_models = all_models.uniq

    @mcs_hash = Hash.new

    @diff_models.each do |diff_model|

      model_items = @ordered_items.select { |x| x["model"].id == diff_model }

      all_model_colors = model_items.collect { |x| x["color"].id }
      diff_model_colors = all_model_colors.uniq

      answers = Array.new

      diff_model_colors.each do |model_color|
        model_color_items = model_items.select { |x| x["color"].id ==  model_color }
        answer_lines = Array.new

        answer_lines.push(model_color)
        total_quantity = 0
        @sizes.each do |s|
          q = "0"
          model_color_items.each do |item|
            if item["size"].id == s.id
              q = item["quantity"]
              total_quantity += q.to_i
              break
            end
          end
          answer_lines.push(q)
        end
        answer_lines.push(total_quantity)
        answers.push(answer_lines)
      end

      @mcs_hash[diff_model] = answers
    end
  end
end
