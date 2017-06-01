# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  email = Faker::Internet.email
  name = "伊藤　博文"
  password = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: n
               )
end

n = 1
while n <= 100
  Topic.create(
    title: "あああ",
    content: "いいい",
    user_id: n
  )
  n = n + 1
end

n = 1
while n <= 100
  Comment.create(
    user_id: n,
    topic_id: 1,
    content: "コメント"
  )
  n = n + 1
end
