FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "user#{n}" }
      sequence(:email) { |n| "user#{n}@testing.com" }
    end
end