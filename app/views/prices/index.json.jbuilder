json.array!(@prices) do |price|
  json.extract! price, :id, :product_id, :from_date, :price, :domain_id, :note
  json.url price_url(price, format: :json)
end
