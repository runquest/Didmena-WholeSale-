module CartHelper
  def available(mid, cid, sid)
    @cart_product = Product.where(model_id: mid, color_id: cid, size_id: sid).take
    return @cart_product.in_storage?
  end

  def total_cost_function
    # binding.pry

    return total_cost
  end

  def get_model_class(model)
    return model.title.delete(' ').downcase; 
  end

  def get_price_class(model)
    return "price_" + get_model_class(model)
  end

  def get_cost_class(model)
    return "cost_" + get_model_class(model)
  end

  def get_toggle_id(model)
    return "toggle_" + get_model_class(model)
  end

  def get_toggle_table_id(model)
    return "toggle_table_" + get_model_class(model)
  end

  def products_for_color model_id,color_id
    list_products = []
    all_sizes.each do |size_id|
      product = Product.where(model_id: model_id, color_id: color_id, size_id: size_id)
      list_products.push(product)
    end
    return list_products
  end

#   Total Cost: 219.78
# discount: 100.00
# Final Cost: 119.00


  def is_product_of_model_color_available(mid, cid)
    products_model_color = Product.where(model_id: mid, color_id: cid)
    array_products_storage_status = products_model_color.map {|r| r.in_storage}
    return array_products_storage_status.include? true
  end

  def some_product_id(mid, cid, sid)
    return Product.where(model_id: mid, color_id: cid, size_id: sid).take.id
  end

  def how_much(pid)
    if @cart.keys.include?(pid.to_s)
      return @cart[pid.to_s].to_i
    else
      return 0
    end
  end 
end