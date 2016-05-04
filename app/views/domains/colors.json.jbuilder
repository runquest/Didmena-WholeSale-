json.array!(@colors) do |color|
  json.extract! color, :id, :domain_name, :code_value, :meaning, :special_case, :note
  json.url domain_url(color, format: :json)
end