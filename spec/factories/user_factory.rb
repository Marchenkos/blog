FactoryBot.define do
  factory :user, class: 'User' do
    email    { Faker::Internet.email }
    username { Faker::Name.unique.first_name }
    password { 'St30&ronG%' }
  end
end
