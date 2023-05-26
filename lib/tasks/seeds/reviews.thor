require 'faker'
require 'rails'
require File.expand_path('config/environment.rb')

module Seeds
  class Reviews < Thor
    desc 'generate', 'Generates multiple Reviews'

    method_option :number, aliases: '-n', type: :numeric, default: 16, desc: 'Clear out all existing Users'
    method_option :clear, aliases: '-c', type: :boolean, default: false, desc: 'Number of Users to create'

    def generate
      Reviews.destroy_all if !Rails.env.production? && options[:clear]

      users_count = User.count
      return if users_count.zero?

      (1..options[:number]).each do |_|
        random_user = User.offset(rand(users_count)).first

        title = Faker::Lorem.sentence
        body = Faker::Lorem.paragraph(sentence_count: rand(10..30))
        author = Faker::Book.author
        book_name = Faker::Book.title

        Review.create(title:, body:, author:, book_name:, user: random_user)

        puts "Created review for user - #{random_user.id}"
      end
    end
  end
end
