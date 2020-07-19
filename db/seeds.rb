1.upto(6) do |i|
  User.create(
    email: "user-#{i}@example.com",
    name: "username#{i}"
  )
end

1.upto(3) do |i|
  Conversation.create(
    sender: i+0,
    recipient: i+1
  )
end
