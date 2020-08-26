FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "user#{n}"}
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email}
    password { "password"}
  end
end
