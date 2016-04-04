json.array!(@products) do |product|
  json.extract! product, :id, :model_id, :color_id, :size_id
  json.url product_url(product, format: :json)
end
