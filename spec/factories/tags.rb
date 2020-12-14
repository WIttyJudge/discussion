FactoryBot.define do
  sequence(:name) { |n| "#{Faker::Games::Dota.hero}#{n}" }
  factory :tag do
    name { generate(:name) }
    # TODO: Add faker to guideline and decription
    guideline { 'text' }
    about { 'text' }

    trait :colored do
      text_color_hex { Faker::Color.hex_color }
      bg_color_hex { Faker::Color.hex_color }
    end
  end
end
