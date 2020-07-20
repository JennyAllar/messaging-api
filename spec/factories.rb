FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "user#{n}" }
      sequence(:email) { |n| "user#{n}@testing.com" }
    end

    factory :conversation do
      sequence(:sender_id) { |n| n+1 }
      sequence(:recipient_id) { |n| n }
    end

    factory :message do
      sequence(:user_id) { |n| n }
      sequence(:content) { |n| "oh hi, #{n}" }
      sequence(:conversation_id) { |n| n }
    end
end
