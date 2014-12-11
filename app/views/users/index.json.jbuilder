json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :password, :usertype, :block, :sendEmail, :registerDate, :lastvisitDate, :activation, :params, :lastResetTime, :resetCount
  json.url user_url(user, format: :json)
end
