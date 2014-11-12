json.array!(@users) do |user|
  json.extract! user, :id, :uname, :email, :passw, :is_active, :is_blocked, :created_at, :updated_at
  json.url user_url(user, format: :json)
end
