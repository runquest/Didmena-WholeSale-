json.array!(@models) do |model|
  json.extract! model, :id, :code, :title, :gender_id, :category_id, :note
  json.url model_url(model, format: :json)
end
