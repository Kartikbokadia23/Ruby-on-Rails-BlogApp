json.extract! member, :id, :name, :email, :age, :role_id, :address, :contact, :password, :token :created_at, :updated_at
json.url member_url(member, format: :json)
