FactoryBot.define do
  sequence(:username) { |n| "#{Faker::Book.author}#{n}" }

  factory :user do
    username { generate(:username) }
    email { Faker::Internet.email }
    password { SecureRandom.hex }

    # Add role to user
    # create(:user, :with_role, role: 'myrole')
    trait :with_role do
      transient do
        role { 'almighty' }
      end

      after(:create) do |user, evaluator|
        user.add_role evaluator.role
      end
    end
  end
end