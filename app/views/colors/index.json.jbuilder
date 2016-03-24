json.array!(@colors) do |color|
  json.extract! color, :id, :name, :sizes
  json.url color_url(color, format: :json)
end
