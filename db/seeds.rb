User.find_or_create_by!(email: "admin@mwbc.com.ng") do |user|
  user.name = "Admin"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.role = "admin"
end
