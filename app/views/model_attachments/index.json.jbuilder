json.array!(@model_attachments) do |model_attachment|
  json.extract! model_attachment, :id, :model_id, :avatar
  json.url model_attachment_url(model_attachment, format: :json)
end
