module OrdersHelper

  def find_contact(order)
      User.find(order.contact).full_name
  end

  def find_product(purchase)
    Product.find(purchase.product_id)
  end

  def find_price(purchase)
    product = find_product(purchase)
    Model.find(product.model_id).price
  end

  def find_model(product)
    Model.find(product.model_id)
  end 

  def find_color(product)
    Domain.find(product.color_id).meaning
  end

  def find_size(product)
    Domain.find(product.size_id).code_value
  end
end
