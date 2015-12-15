json.array! @users do |user|
  json.email user.email
  json.keys_count user.access_keys.size
end