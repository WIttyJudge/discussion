FactoryBot.define do
  sequence(:name) { |n| "#{Faker::Games::Dota.hero}#{n}" }
  factory :tag do
    name { generate(:name) }
  end
end

