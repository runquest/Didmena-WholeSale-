json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :order_id, :product_id, :quantity, :note
  json.url purchase_url(purchase, format: :json)
end
