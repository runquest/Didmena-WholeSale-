module ProductsHelper

  def find_model(id)
    product = find_product(id)
    Model.find(product.model_id)
  end

  def find_product(id)
    Product.find(id)
  end

  def compute_price(qty, id)
    product = find_product(id)
    model = find_model(product.model_id)
    price = model.price
    sprintf "%.2f", qty.to_i * price
  end

  def find_color(id)
    product = find_product(id)
    Domain.find(product.color_id).meaning
  end

  def find_size(id)
    product = find_product(id)
    Domain.find(product.size_id).code_value
  end

end
