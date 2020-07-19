1.upto(5) do |i|
  User.create(
    email: "user-#{i}@example.com",
    name: "username#{i}"
  )
end
