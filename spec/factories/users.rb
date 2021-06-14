FactoryBot.define do
  factory :user do
    username { "Test User" }
    email { "test@example.com" }
    password { "please123" }
  end
end
