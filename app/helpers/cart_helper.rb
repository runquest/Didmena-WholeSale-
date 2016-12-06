module CartHelper
  def available(mid, cid, sid)
    @cart_product = Product.where(model_id: mid, color_id: cid, size_id: sid).take
    return @cart_product.in_storage?
  end

  def is_product_of_model_color_available(mid, cid)
    products_model_color = Product.where(model_id: mid, color_id: cid)
    array_products_storage_status = products_model_color.map {|r| r.in_storage}
    return array_products_storage_status.include? true
  end

  def some_product_id(mid, cid, sid)
    # binding.pry
    # Product.where(model_id: mid, color_id: cid, size_id: sid).take.id

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