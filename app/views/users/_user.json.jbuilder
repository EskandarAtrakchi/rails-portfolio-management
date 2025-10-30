json.extract! user, :id, :first_name, :last_name, :username, :email, :password_digest, :phone_number, :bio, :profile_image_url, :created_at, :updated_at
json.url user_url(user, format: :json)
