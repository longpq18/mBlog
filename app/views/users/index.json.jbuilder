json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :uname, :pword, :email, :address, :phone, :permission_id, :status
  json.url user_url(user, format: :json)
end
