json.array!(@sizes) do |size|
  json.extract! size, :id, :code_value
  json.url domain_url(size, format: :json)
end