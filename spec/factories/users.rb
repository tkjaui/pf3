FactoryBot.define do
  factory :user do
    username {"tarou"}
    sequence(:email) { |n| "example#{n}@example.com"}
    password {"password"}
  end
end
