json.array!(@orders) do |order|
  json.extract! order, :id, :order_number, :order_date, :representative_id, :total_quantity, :total_price, :discount, :domain_id, :contact, :note
  json.url order_url(order, format: :json)
end
