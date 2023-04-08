FactoryBot.define do
  factory :user do
    email              { Faker::Internet.email }
    username           { Faker::Name.username }
    password           { Faker::Internet.password(min_length: 8, max_length: 20, special_characters: true) }
  end
end