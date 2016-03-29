json.array!(@domains) do |domain|
  json.extract! domain, :id, :domain_name, :code_value, :meaning, :special_case, :note
  json.url domain_url(domain, format: :json)
end
