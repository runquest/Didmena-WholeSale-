module ModelsHelper

  def find_model_product(color, size)
    @model_product = Product.where(size_id: size).where(color_id: color).where(model_id: @model.id)
  end

  def can_order?
    return product_exist && product_in_storage
  end

  def product_exist
    return @model_product.exists?
  end

  def product_in_storage
    return @model_product.take.in_storage
  end

  def value(color)
    Domain.find(color).meaning
  end

end



