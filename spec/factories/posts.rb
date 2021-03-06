FactoryBot.define do
  sequence(:title) { |n| "#{Faker::Book.title}#{n}" }

  factory :post do
    title { generate(:title) }
    body { Faker::Lorem.sentences }
    author factory: :user
  end
end
