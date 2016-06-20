module ProductsHelper

  def compute_price(qty, price)
    sprintf "%.2f", qty.to_i * price
  end
end
