FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "test#{n}" }
    sequence(:name) { |n| "テストアカウント#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
  end
end