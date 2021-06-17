FactoryBot.define do
  factory :user do
    sequence(:username) { |u| "#{u}user" }
    sequence(:email) { |n| "#{n}user@example.com" }
    # username { "Test User" }
    # email { "test@example.com" }
    password { "please123" }
  end
end
