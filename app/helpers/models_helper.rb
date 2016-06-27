module ModelsHelper

  def find_models_products(color, size)
    Product.where(size_id: size).where(color_id: color).where(model_id: @model.id).take
  end

  def product_exist?(color, size)  
    Product.where(size_id: size).where(color_id: color).where(model_id: @model.id).exists?
  end

  def product_in_storage?(color, size)
    Product.where(size_id: size).where(color_id: color).where(model_id: @model.id).take.in_storage
  end

  def value(color)
    Domain.find(color).meaning
  end

end



