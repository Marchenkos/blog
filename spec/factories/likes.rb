FactoryBot.define do
  factory :like_of_review, class: Like do
    association :user, factory: :user
    association :likable, factory: :review
  end
end
