FactoryBot.define do
  factory :word do
    association :user
    name        { Faker::Lorem.characters(number:5) }
    description { Faker::Lorem.characters(number:20) }
    is_published { true }
  end
end