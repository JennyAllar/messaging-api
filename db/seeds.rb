1.upto(6) do |i|
  User.create(
    email: "user-#{i}@example.com",
    name: "username#{i}"
  )
end
