class CartController < ApplicationController

  def add_items_to_cart
    @items = params[:_json]
    @items.each do |item|
      initiate_cart
      @cart[item.keys.first] = item.values.first
    end
    redirect_to "/cart"
  end

  def initiate_cart
    if session[:cart] then
      @cart = session[:cart]
    else
      session[:cart] = {}
      @cart = session[:cart]
    end
  end

  def update_cart
    session[:cart] = {}
    params[:_json].each do |item|
      pid = item.keys[0];
      amount = item.values[0];
      session[:cart][pid] = amount;
    end
    redirect_to :action => :show
  end

  def empty_cart
    session[:cart] = nil
    redirect_to :action => :show
  end

  # not really sure what is this meant to do
  # guessing it something that happens when user logs out
  def delete_session_cart
    id = params[:product_id]
    @cart.delete(id)
    redirect_to :back, notice: t('.notice')
  end

####################### - cart view methods - ##################

  # products and amounts ordered
  # models ordered
  # colors in model
  # products in models in storage

  def products_amounts_ordered
    @product_amount_list = {}
    @cart.each do |item|
      product = Product.find(item[0].to_i)
      amount = item[1].to_i
      @product_amount_list[product] = amount
    end
  end

  def models_in_order
    @models_ordered = {}
    @product_amount_list.each do |product, amount|
      model = Model.find(product.model_id)
      colors = Product.where(model_id: product.model_id).map {|product| product.color_id}
      @models_ordered[model] = colors.uniq!
    end
  end

  ############

  def convertCartToOrderItemList
    @order_item_list = []
    @cart.each do |item|
      product_id = item[0].to_i
      amount = item[1].to_i
      ordered_item = OrderedItem.new(product_id, amount)
      @order_item_list.push(ordered_item)
    end
    return @order_item_list
  end

  def filterModels
    @models_ordered = []
    @order_item_list.each do |item|
      @models_ordered.push(item.getModel)
    end
    return @models_ordered
  end

  def filterColorsForModels
    @mColors = {}
    @order_item_list.each do |item|
      model = item.getModel
      @mColors[model] = item.getUniqueColorsForModel
    end
    return @mColors
  end

  def filterProductsForModelsColor
    @products_for_models_color = []
    @mColors.each do |model, colors|
      colors.each do |color|
        all_sizes.each do |size|
          product = Product.where(model_id: model.id).where(color_id: color).where(size_id: size.id)
          @products_for_models_color.push(product)
        end
      end
    end
    return @products_for_models_color
  end

  def show
    initiate_cart
    convertCartToOrderItemList
    filterModels
    filterColorsForModels
    filterProductsForModelsColor
    products_amounts_ordered
    models_in_order
    @cart_total_cost = 0
  end
end