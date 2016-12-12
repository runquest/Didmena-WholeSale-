class OrderedItem

  def initialize(id, amount)
    @product_id = id
    @amount = amount
  end

  def productId
    @product_id
  end

  def amount
    @amount
  end

  def getModel
    model_id = Product.find(@product_id).model_id
    return Model.find(model_id)
  end

  def getUniqueColorsForModel
    colors = Product.where(model_id: getModel.id).map { |product| product.color_id }
    return colors.uniq
  end
  
  # attr_accessor :getProductModel

  #  def initialize(product_id, product_amount)
  #     product = Product.find(product_id)
  #     amount = product_amount
  #  end

  #  def getProductId
  #   return @oi_product_id
  #  end

  #  def getProduct
  #   return Product.find(@oi_product_id)
  #  end

  #  def getProductAmount
  #   return @oi_product_amount
  #  end

  #  def getProductColorId
  #   getProduct.color_id
  #  end

  #  def getProductSizeId
  #   getProduct.size_id
  #  end

  #  def getProductModelId
  #   getProduct.model_id
  #  end

  #  def getProductModel
  #   binding.pry
  #   return Model.find(getPorductModelId)
  #  end

  #  def setProductAmount(amount)
  #   @oi_product_amount = amount
  #  end
end