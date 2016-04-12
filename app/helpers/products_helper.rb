module ProductsHelper

  def compute_price(qty, price)
    qty.to_i * price
  end
end
