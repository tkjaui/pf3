FactoryBot.define do
  factory :review do
    content { "MyString" }
    score { 1 }
    association :user
    association :service
  end
end
