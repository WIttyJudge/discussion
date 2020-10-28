FactoryBot.define do
  sequence(:username) { |n| "#{Faker::Book.author}#{n}" }

  factory :user do
    username { generate(:username) }
    email { Faker::Internet.email }
    password { SecureRandom.hex }
  end
end