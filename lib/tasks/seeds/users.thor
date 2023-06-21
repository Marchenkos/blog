require 'rails'
require File.expand_path('config/environment.rb')

module Seeds
  class Users < Thor
    desc 'generate', 'Generates multiple Users'
    method_option :number, aliases: '-n', type: :numeric, default: 5, desc: 'Number of Users to create'
    method_option :clear, aliases: '-c', type: :boolean, default: false, desc: 'Clear out all existing Users'

    def generate
      # load_rails_environment
      Users.destroy_all if !Rails.env.production? && options[:clear]

      (1..options[:number]).each do |_|
        email = Faker::Internet.email
        username = Faker::Internet.username(specifier: 5..15, separators: ['-'])

        User.find_or_create_by(email:, username:) do |user|
          user.password = '&TestPassword1*'
        end
      end
    end
  end
end
