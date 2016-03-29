json.array!(@users) do |user|
  json.extract! user, :id, :email, :fname, :name, :password_digest, :status, :apps_manager, :phone, :description
  json.url user_url(user, format: :json)
end
