# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 管理者
AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  encrypted_password: 'password'
  ) if Rails.env.development?

# ユーザ
User.create!(id: "test",
             name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             encrypted_password: "foobar")
20.times do |n|
  id = "test#{n+1}"
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(id: id.to_s,
               name:  name,
               email: email,
               password:              password,
               encrypted_password: password)
end

# 投稿
users = User.order(:created_at).take(6)
20.times do
  name = Faker::Book.title
  english_name = Faker::Book.unique.title
  description = Faker::Book.publisher
  is_published = Faker::Boolean.boolean
  users.each { |user| user.words.create!(name: name, english_name: name, description: description, is_published: is_published) }
end