FactoryBot.define do
  sequence(:name) { |n| "#{Faker::Games::Dota.hero}#{n}" }
  factory :tag do
    name { generate(:name) }
    # TODO: Add faker to guideline and decription
    guideline { 'text' }
    description { 'text' }
  end
end
