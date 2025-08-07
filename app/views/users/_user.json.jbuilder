json.extract! user, :id, :name, :user_type, :user_photo, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
