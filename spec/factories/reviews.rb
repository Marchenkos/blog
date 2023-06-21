FactoryBot.define do
  factory :review do
    title     { Faker::Lorem.sentence }
    body      { Faker::Lorem.paragraph(sentence_count: 5) }
    author    { Faker::Book.author }
    book_name { Faker::Book.title }
    association :user, factory: :user
  end
end
