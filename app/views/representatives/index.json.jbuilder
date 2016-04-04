json.array!(@representatives) do |representative|
  json.extract! representative, :id, :company_id, :user_id, :note
  json.url representative_url(representative, format: :json)
end
