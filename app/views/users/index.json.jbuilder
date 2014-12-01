json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :is_active, :is_blocked, :created_at, :updated_at
  json.url user_url(user, format: :json)
end
