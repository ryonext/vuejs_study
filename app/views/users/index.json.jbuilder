json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :profile
  json.url user_url(user, format: :json)
end
