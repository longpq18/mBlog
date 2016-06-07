json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :name, :content, :status, :category_id
  json.url post_url(post, format: :json)
end
