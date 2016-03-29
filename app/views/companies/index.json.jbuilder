json.array!(@companies) do |company|
  json.extract! company, :id, :title, :email, :status, :domain_id, :city, :street, :postal_code, :phone, :description
  json.url company_url(company, format: :json)
end
